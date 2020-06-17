//
//  ProfilCollectionViewCell.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 18/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilCollectionViewCell: UICollectionViewCell {
    
    var listUser: User?
    let cursus_id: Int = 1
    var users: [User] = []
    let charactereSpe: String = "₳"

    let viewContent             = CustomView()
    let image                   = CustomImage()
    let imageBackGround         = CustomImage()
    let displayName             = CustomLabel()
    let emailLabel              = CustomLabel()
    let walletLabel             = CustomLabel()
    let correctionPointsLabel   = CustomLabel()
    let levelLabel              = CustomLabel()
    let gradeLabel              = CustomLabel()
    let progressView            = CustomProgressBar()
    
    let labelWallet             = CustomLabel()
    let labelCorectionPoints    = CustomLabel()
    let labelGrade              = CustomLabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder, has not been implemented")
    }
    
    func setCell(_ listUser: User) {
        self.listUser = listUser
        self.users.append(listUser)
        self.contentView.backgroundColor = .white
        guard let user = self.listUser else {return print("Error User")}
        
        self.displayName.setLabelCell()
        self.displayName.text = user.displayname
        
        self.emailLabel.setLabelCell()
        self.emailLabel.text = user.email
        
        self.walletLabel.setLabelCell()
        self.walletLabel.text = String(user.wallet) + charactereSpe
        
        self.correctionPointsLabel.setLabelCell()
        self.correctionPointsLabel.text = String(user.correctionPoints)
        
        self.levelLabel.setLabelCell()
        self.progressView.setBar()
        self.gradeLabel.setLabelCell()
        
        if let skillSelected = user.cursusUser.first(where: { $0.cursus.id == self.cursus_id}) {
            self.levelLabel.text = "Level " + String(skillSelected.level) + "%"
            self.progressView.progress = progressView.setLevel(level: skillSelected.level)
            self.gradeLabel.text = (skillSelected.grade ?? "Unknow")
        }
        
        self.labelCorectionPoints.setLabelCell()
        self.labelCorectionPoints.text = "Correction points"
        
        self.labelGrade.setLabelCell()
        self.labelGrade.text = "Grade"
        
        self.labelWallet.setLabelCell()
        self.labelWallet.text = "Wallet"

        self.image.setImage()
        self.image.makeRouned()
        self.image.dowloadImageSet(url: user.imageUrl)

        self.imageBackGround.setImageBackground()
        self.imageBackGround.image = UIImage(named: "42")
        
        self.viewContent.setView()
        
        self.addsubView()
        self.setAnchor()
    }
    
    func addsubView() {
        self.contentView.addSubview(imageBackGround)
        self.contentView.addSubview(viewContent)
        self.contentView.addSubview(displayName)
        self.contentView.addSubview(image)
        self.contentView.addSubview(emailLabel)
        self.contentView.addSubview(walletLabel)
        self.contentView.addSubview(labelWallet)
        self.contentView.addSubview(correctionPointsLabel)
        self.contentView.addSubview(labelCorectionPoints)
        self.contentView.addSubview(progressView)
        self.contentView.addSubview(levelLabel)
        self.contentView.addSubview(gradeLabel)
        self.contentView.addSubview(labelGrade)
    }
    
    func setAnchor() {
        let constantsLeading: CGFloat = 5
        let topAnchor: CGFloat = 10
        
        self.displayName.topAnchor.constraint(equalTo: self.viewContent.topAnchor, constant: 5).isActive = true
        self.displayName.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true

        self.emailLabel.topAnchor.constraint(equalTo: self.displayName.bottomAnchor, constant: topAnchor).isActive = true
        self.emailLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.labelWallet.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 25).isActive = true
        self.labelWallet.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
  
        self.walletLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 25).isActive = true
        self.walletLabel.leadingAnchor.constraint(equalTo: self.viewContent.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
        
        self.labelCorectionPoints.topAnchor.constraint(equalTo: self.walletLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.labelCorectionPoints.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.correctionPointsLabel.topAnchor.constraint(equalTo: self.walletLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.correctionPointsLabel.leadingAnchor.constraint(equalTo: self.viewContent.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
        
        self.labelGrade.topAnchor.constraint(equalTo: self.labelCorectionPoints.bottomAnchor, constant: topAnchor).isActive = true
        self.labelGrade.leadingAnchor.constraint(equalTo: self.viewContent.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
        
        self.gradeLabel.topAnchor.constraint(equalTo: self.correctionPointsLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.gradeLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.levelLabel.centerYAnchor.constraint(equalTo: self.progressView.centerYAnchor).isActive = true
        self.levelLabel.centerXAnchor.constraint(equalTo: self.progressView.centerXAnchor).isActive = true
       
        self.progressView.topAnchor.constraint(equalTo: self.viewContent.bottomAnchor, constant: 5).isActive = true
        self.progressView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.progressView.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.progressView.heightAnchor.constraint(equalToConstant: 25).isActive = true

        self.viewContent.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: 10).isActive = true
        self.viewContent.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.viewContent.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        self.viewContent.bottomAnchor.constraint(equalTo: self.gradeLabel.bottomAnchor, constant: 5).isActive = true
        
        self.image.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        self.image.centerXAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        self.imageBackGround.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.imageBackGround.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.imageBackGround.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.imageBackGround.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
}
