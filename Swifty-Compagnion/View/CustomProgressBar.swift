//
//  CustomProgressBar.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 20/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit


class CustomProgressBar: UIProgressView {
    
    func setBar() {
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLevel(level: Float) -> Float{
         let x = Int(level)
         let levelPercent = level - Float(x)
         return levelPercent
     }
}
