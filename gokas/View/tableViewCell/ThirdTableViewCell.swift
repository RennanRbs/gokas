//
//  ThirdTableViewCell.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class ThirdTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var secondCollectionView: UICollectionView!
    var gokasContent: (GokasModel)? = nil
    
    static let identifier = "ThirdTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ThirdTableViewCell", bundle: nil)
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        secondCollectionView.delegate = self
        secondCollectionView.dataSource = self
        secondCollectionView.register(SecondCollectionViewCell.nib(), forCellWithReuseIdentifier: SecondCollectionViewCell.identifier)
        secondCollectionView.showsHorizontalScrollIndicator = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        secondCollectionView.collectionViewLayout = layout
        updateValues()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gokasContent?.products?.count ?? 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondCollectionViewCell.identifier, for: indexPath) as! SecondCollectionViewCell
        cell.imageView.image(fromUrl: gokasContent?.products?[indexPath.row].imageURL ?? "error")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}


extension ThirdTableViewCell {
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
            self.secondCollectionView.reloadData()
        })
    }
}
