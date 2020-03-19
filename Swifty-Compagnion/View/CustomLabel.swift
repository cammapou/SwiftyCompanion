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
    
    func setLabelSkillCell() {
        self.textColor = .black
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 16)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLabelCell() {
        self.textColor = .white
        self.textAlignment = .left
        self.font = UIFont.systemFont(ofSize: 17)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setLabelTitle() {
        self.textColor = .black
        self.textAlignment = .left
        self.font = UIFont.boldSystemFont(ofSize: 20)
        self.layer.cornerRadius = 10
        self.textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
