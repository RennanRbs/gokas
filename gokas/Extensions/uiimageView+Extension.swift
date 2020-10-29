//
//  uiimageView+Extension.swift
//  gokas
//
//  Created by Rennan Rebouças on 29/10/20.
//  Copyright © 2020 Rennan Rebouças. All rights reserved.
//

import UIKit

extension UIImageView {
    public func image(fromUrl urlString: String) {
        guard let url = URL(string: urlString) else {
            print("Couldn't create URL from \(urlString)")
            return
        }
        let theTask = URLSession.shared.dataTask(with: url) {
            data, response, error in
            if let responseData = data {
                DispatchQueue.main.async {
                    self.image = UIImage(data: responseData)
                }
            }
        }
        theTask.resume()
    }
}
