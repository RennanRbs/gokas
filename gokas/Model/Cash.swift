//
//  Cash.swift
//  gokas
//
//  Created by Rennan Rebouças on 29/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import Foundation

struct Cash : Codable {
    let title : String?
    let bannerURL : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case bannerURL = "bannerURL"
        case description = "description"
    }


}
