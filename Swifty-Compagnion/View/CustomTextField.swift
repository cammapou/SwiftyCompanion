//
//  CustomTextField.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 06/03/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class CustomTextFiel: UITextField {
    
    func setTextFiel() {
        self.placeholder = "   Login"
        self.textAlignment = .left
        self.backgroundColor = .white
        self.textColor = .black
        self.tintColor = .lightGray
        self.layer.cornerRadius = 5
        self.autocorrectionType = .no
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
