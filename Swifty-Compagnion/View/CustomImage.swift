//
//  CustomImage.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 20/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit


class CustomImage: UIImageView {
    
    func setImage() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
    
    func setImageBackground() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleToFill
    }
    
    
    func makeRouned() {
        self.frame.size.height = CGFloat(100)
        self.frame.size.width = CGFloat(100)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = frame.height / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
    
    func dowloadImageSet(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.global().async { [weak self] in
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }.resume()
    }
}
