//
//  CustomLabel.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 20/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit

class CustomLabel: UILabel {
    
    func setLabelCell() {
        self.textColor = .white
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLabelInfCell() {
        self.textColor = .white
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 20)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}