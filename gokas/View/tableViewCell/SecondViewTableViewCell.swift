//
//  SecondViewTableViewCell.swift
//  gokas
//
//  Created by Rennan Rebouças on 28/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

class SecondViewTableViewCell: UITableViewCell {

    @IBOutlet weak var imageview: UIImageView!
    static let identifier = "SecondViewTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "SecondViewTableViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView?.layer.cornerRadius = 10
        imageView?.clipsToBounds = true
        
        
    }

    
}
