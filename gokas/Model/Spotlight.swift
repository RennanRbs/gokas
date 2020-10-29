//
//  Spotlight.swift
//  gokas
//
//  Created by Rennan Rebouças on 29/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import Foundation

struct Spotlight : Codable {
    let name : String?
    let bannerURL : String?
    let description : String?

    enum CodingKeys: String, CodingKey {

        case name = "name"
        case bannerURL = "bannerURL"
        case description = "description"
    }



}

