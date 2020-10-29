//
//  GokasModel.swift
//  gokas
//
//  Created by Rennan Rebouças on 29/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import Foundation

struct GokasModel : Codable {
    let spotlight : [Spotlight]?
    let products : [Products]?
    let cash : Cash?

    enum CodingKeys: String, CodingKey {

        case spotlight = "spotlight"
        case products = "products"
        case cash = "cash"
    }


}
