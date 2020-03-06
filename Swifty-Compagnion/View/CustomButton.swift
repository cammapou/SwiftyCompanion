//
//  CustomButton.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 20/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton {
 
    func setButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isUserInteractionEnabled = true
    }
    
    func setLoginButton() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel?.textColor = .white
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .black
        self.layer.cornerRadius = 5
    }
}
