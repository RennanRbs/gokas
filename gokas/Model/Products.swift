//
//  Products.swift
//  gokas
//
//  Created by Rennan Rebouças on 29/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import Foundation

struct Products : Codable {
    let name : String?
    let imageURL : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case imageURL = "imageURL"
        case description = "description"
    }



}

