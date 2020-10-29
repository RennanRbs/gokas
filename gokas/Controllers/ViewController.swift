//
//  ViewController.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

enum NetworkError: Error {
    case badURL
}



class ViewController: UIViewController  {
    
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var gokasContent: (GokasModel)? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewConfiguration()
        updateValues()
    }
    
    func tableViewConfiguration(){
        tableView.register(FirstCollectionTableViewCell.nib(), forCellReuseIdentifier: FirstCollectionTableViewCell.identifier)
        tableView.register(SecondViewTableViewCell.nib(), forCellReuseIdentifier: SecondViewTableViewCell.identifier)
        tableView.register(ThirdTableViewCell.nib(), forCellReuseIdentifier: ThirdTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorColor = .clear
    }
    
    
    func getRequestGokas(completion: @escaping ((Result<GokasModel,NetworkError>)-> Void)){
        
        guard let url = URL(string: "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products")
            else{return}
        URLSession.shared.dataTask(with: url){(data,responde,error) in
            guard let dataResponse = data, error == nil else {
                completion(.failure(NetworkError.badURL))
                return
            }
            do {
                let gokas  = try JSONDecoder().decode(GokasModel.self, from: dataResponse)
                completion(.success(gokas))
            } catch {completion(.failure(.badURL))}
        }.resume()
    }
    
    func updateValues(){
        getRequestGokas { (Result) in
            switch Result {
                case .success(let data):
                print(data)
                self.gokasContent = data
                case .failure(let error):
                    print(error)
            }
            
        }
    }
    
    
}




// MARK: extension TableView Delegate and Datasource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: FirstCollectionTableViewCell.identifier, for: indexPath) as! FirstCollectionTableViewCell
            
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = UITableViewCell()
            cell.textLabel?.text = gokasContent?.cash?.title ?? "test"
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: SecondViewTableViewCell.identifier, for: indexPath) as! SecondViewTableViewCell
            cell.imageView?.backgroundColor = .black
            return cell
        }
        if indexPath.row == 3 {
            let cell = UITableViewCell()
            cell.textLabel?.text = "Produtos"
            return cell
        }
        
        if indexPath.row == 4 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.identifier, for: indexPath) as! ThirdTableViewCell
            return cell
        }
            
        else{
                let cell = UITableViewCell()
                cell.textLabel?.text = "texto"
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.row == 1 || indexPath.row == 3) {return 50}
        if (indexPath.row == 4) {return 100}
        else {return 200}
    }
}




