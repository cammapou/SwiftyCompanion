//
//  ProfilCollectionViewCell.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 18/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilCollectionViewCell: UICollectionViewCell {
    
    var listUser: User!
    var cursus_id: Int = 1
    var users: [User] = []
    
    var viewContent             = CustomView()
    var image                   = CustomImage()
    var imageBackGround         = CustomImage()
    var loginLabel              = CustomLabel()
    var displayName             = CustomLabel()
    var emailLabel              = CustomLabel()
    var walletLabel             = CustomLabel()
    var correctionPointsLabel   = CustomLabel()
    var levelLabel              = CustomLabel()
    var gradeLabel              = CustomLabel()
    var progressView            = CustomProgressBar()
    
    let labelPhone: String = "Phone                     "
    let labelWallet: String = "Wallet                     "
    let labelLocation: String = "Location                 "
    let labelCorectionPoints: String = "Evaluation points   "
    let labelGrade: String = "Grade                     "
    let charactereSpe: String = "₳"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init coder, has not been implemented")
    }
    
    func setCell(_ listUser: User) {
        self.listUser = listUser
        self.users.append(listUser)
        
        guard let user = self.listUser else {return print("Error User")}
      
        self.displayName.setLabelCell()
        self.displayName.text = user.displayname
        self.emailLabel.setLabelCell()
        self.emailLabel.text = user.email
        self.walletLabel.setLabelCell()
        self.walletLabel.text = labelWallet + String(user.wallet) + charactereSpe
        self.correctionPointsLabel.setLabelCell()
        self.correctionPointsLabel.text = labelCorectionPoints + String(user.correctionPoints)
        self.levelLabel.setLabelCell()
        self.progressView.setBar()
        self.gradeLabel.setLabelCell()
        
        if let skillSelected = user.cursusUser.first(where: { $0.cursus.id == self.cursus_id}) {
            self.levelLabel.text = "Level " + String(skillSelected.level) + "%"
            self.progressView.progress = setLevel(level: skillSelected.level)
            self.gradeLabel.text = labelGrade + (skillSelected.grade ?? "Unknow")
        }
        
        self.loginLabel.setLabelCell()
        self.loginLabel.text = user.login

        self.image.setImage()
        self.image.makeRouned()
        self.image.dowloadImageSet(url: user.imageUrl)

        self.imageBackGround.setImageBackground()
        self.imageBackGround.image = UIImage(named: "the-order")
        
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
        self.contentView.addSubview(correctionPointsLabel)
        self.contentView.addSubview(levelLabel)
        self.contentView.addSubview(progressView)
        self.contentView.addSubview(loginLabel)
        self.contentView.addSubview(gradeLabel)
    }
    
    func setLevel(level: Float) -> Float{
        let x = Int(level)
        let levelPercent = level - Float(x)
        return levelPercent
    }
    
    func setAnchor() {
        
        let constantsLeading: CGFloat = 5
        let topAnchor: CGFloat = 10
        
        self.displayName.topAnchor.constraint(equalTo: self.viewContent.topAnchor, constant: 5).isActive = true
        self.displayName.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true

        self.loginLabel.topAnchor.constraint(equalTo: self.image.bottomAnchor, constant: topAnchor).isActive = true
        self.loginLabel.centerXAnchor.constraint(equalTo: self.image.centerXAnchor).isActive = true
       
        self.emailLabel.topAnchor.constraint(equalTo: self.displayName.bottomAnchor, constant: topAnchor).isActive = true
        self.emailLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
  
        self.walletLabel.topAnchor.constraint(equalTo: self.emailLabel.bottomAnchor, constant: 25).isActive = true
        self.walletLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.correctionPointsLabel.topAnchor.constraint(equalTo: self.walletLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.correctionPointsLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.gradeLabel.topAnchor.constraint(equalTo: self.correctionPointsLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.gradeLabel.leadingAnchor.constraint(equalTo: self.viewContent.leadingAnchor, constant: constantsLeading).isActive = true
        
        self.levelLabel.topAnchor.constraint(equalTo: self.correctionPointsLabel.bottomAnchor, constant: 60).isActive = true
        self.levelLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
       
        self.progressView.topAnchor.constraint(equalTo: self.levelLabel.bottomAnchor, constant: topAnchor).isActive = true
        self.progressView.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.progressView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.progressView.heightAnchor.constraint(equalToConstant: 10).isActive = true

        self.viewContent.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        self.viewContent.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        self.viewContent.trailingAnchor.constraint(equalTo: self.image.leadingAnchor, constant: -25).isActive = true
        self.viewContent.bottomAnchor.constraint(equalTo: self.gradeLabel.bottomAnchor, constant: 5).isActive = true
        
        self.image.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 30).isActive = true
        self.image.centerXAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.centerXAnchor, constant: 110).isActive = true
        self.image.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.image.widthAnchor.constraint(equalToConstant: 100).isActive = true

        self.imageBackGround.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.imageBackGround.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.imageBackGround.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.imageBackGround.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true


    }
}
