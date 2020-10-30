//
//  SecondCollectionViewCell.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class SecondCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    static let identifier = "SecondCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
    }

}
