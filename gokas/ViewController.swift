//
//  ViewController.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        setupCollection()
    }
    
    func setupCollection(){
        collectionView?.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cellHeader")
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "id")
        collectionView.backgroundColor = .clear
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.row == 1 || indexPath.row == 3){
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHeader", for: indexPath) as! CollectionViewCell
            return cell
        }
        else {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath)
        cell.backgroundColor = .green
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (indexPath.row == 1 || indexPath.row == 3) {return CGSize(width: collectionView.frame.width, height: 40)}
        else { return CGSize(width: collectionView.frame.width, height: 200)}
    }
    

    
}




