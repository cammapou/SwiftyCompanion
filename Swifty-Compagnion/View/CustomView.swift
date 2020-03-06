//
//  CustomView.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 20/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomView: UIView {
    
    func setView() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        self.layer.opacity = 10
        self.layer.cornerRadius = 5
    }
    
    func setViewProfil() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
