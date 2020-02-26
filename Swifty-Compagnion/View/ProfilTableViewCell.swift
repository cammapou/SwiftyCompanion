//
//  ProfilTableViewCell.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 24/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilTableViewCell: UITableViewCell {
    
    
    let nameLabel = CustomLabel()
    let progressBar = CustomProgressBar()
    var imageIsValid = CustomImage()
    var labelPourcent = CustomLabel()
    var projectUsers: [ProjectsUser] = []
   
    var projectUser: ProjectsUser? {
        didSet {
            if projectUser != nil {
                self.nameLabel.setLabelCell()
                self.nameLabel.textColor = .black
                self.nameLabel.text = projectUser?.project.name
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected st ate
    }
    
    func setupCell(project: ProjectsUser) {
        self.imageIsValid.setImage()
        self.labelPourcent.setLabelCell()
        self.labelPourcent.textColor = .black
        
        if project.final_mark != nil {
            self.labelPourcent.text = String(project.final_mark!)
        } else {
            self.labelPourcent.text = "0"
        }
        
        if project.validated == true {
            imageIsValid.image = UIImage(named: "validate")
        } else {
            imageIsValid.image = UIImage(named: "cancel")
        }
        
        self.contentView.addSubview(imageIsValid)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(labelPourcent)
        self.setAnchor()
        
    }

    func setAnchor() {
        
        self.labelPourcent.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.labelPourcent.trailingAnchor.constraint(equalTo: self.imageIsValid.trailingAnchor, constant: -30).isActive = true
        
        self.imageIsValid.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        self.imageIsValid.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.imageIsValid.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.imageIsValid.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}
