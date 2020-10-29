//
//  FirstCollectionViewCell.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class FirstCollectionViewCell: UICollectionViewCell {
    static let identifier = "FirstCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "FirstCollectionViewCell", bundle: nil)
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
