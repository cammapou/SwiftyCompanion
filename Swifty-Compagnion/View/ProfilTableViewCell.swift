//
//  ProfilTableViewCell.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 24/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilTableViewCell: UITableViewCell {
   
    var projectUsers: [ProjectsUser] = []
    let nameLabel = CustomLabel()
    let progressBar = CustomProgressBar()
    let imageIsValid = CustomImage()
    let labelPourcent = CustomLabel()
   
    var projectUser: ProjectsUser? {
        didSet {
            if projectUser != nil {
                self.nameLabel.setLabelSkillCell()
                self.nameLabel.textColor = .black
                self.nameLabel.text = projectUser?.project.name
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(project: ProjectsUser) {
        self.contentView.backgroundColor = .white
        self.imageIsValid.setImage()
        self.labelPourcent.setLabelSkillCell()
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
        
        self.imageIsValid.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        self.imageIsValid.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.imageIsValid.heightAnchor.constraint(equalToConstant: 20).isActive = true
        self.imageIsValid.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}

class ProfilSkillTableViewCell: UITableViewCell {
    
    var projectUsers: [Skills] = []
    let nameLabel           = CustomLabel()
    let progressBar         = CustomProgressBar()
    let labelPourcent       = CustomLabel()
    let labelLevel          = CustomLabel()
    let progressBarSkill    = CustomProgressBar()
   
    var projectUser: Skills? {
        didSet {
            if projectUser != nil {
                self.nameLabel.setLabelSkillCell()
                self.nameLabel.text = projectUser?.name
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(project: Skills) {
        self.contentView.backgroundColor = .white
        
        self.labelPourcent.setLabelSkillCell()
        self.labelPourcent.textColor = .black
     
        self.progressBarSkill.setBar()
        self.progressBarSkill.progress = progressBarSkill.setLevel(level: project.level)
        
        self.labelPourcent.text = String(project.level) + " %"
    
        self.contentView.addSubview(progressBarSkill)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(labelPourcent)
        self.setAnchor()
    }

    func setAnchor() {
        self.progressBarSkill.topAnchor.constraint(equalTo: self.labelPourcent.bottomAnchor, constant: 10).isActive = true
        self.progressBarSkill.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.progressBarSkill.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
        
        self.labelPourcent.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.labelPourcent.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        
        self.nameLabel.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.nameLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}
