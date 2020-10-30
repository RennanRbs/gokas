//
//  FirstCollectionTableViewCell.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit



class FirstCollectionTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var firstCollectionView: UICollectionView!
    var gokasContent: (GokasModel)? = nil
    static let identifier = "FirstCollectionTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FirstCollectionTableViewCell", bundle: nil)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
        updateValues()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCollection(){
        firstCollectionView.register(FirstCollectionViewCell.nib(), forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
        firstCollectionView.delegate = self
        firstCollectionView.dataSource = self
        firstCollectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        firstCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gokasContent?.spotlight?.count ?? 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
        cell.imageView?.image(fromUrl: gokasContent?.spotlight?[indexPath.row].bannerURL ?? "erro")
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 0.5
        cell.layer.masksToBounds = false
        return cell
    }
    
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 330, height: 180)
        }
}

extension FirstCollectionTableViewCell {
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
        }.resume()    }
    
    func updateValues(){
        getRequestGokas { (Result) in
            switch Result {
                case .success(let data):
                self.gokasContent = data
                self.timeToRealoadTable()
                case .failure(let error):
                    print(error)
            }
            
        }
    }
    
    func timeToRealoadTable()  {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.firstCollectionView.reloadData()
        })
    }
}


