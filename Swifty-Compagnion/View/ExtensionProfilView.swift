//
//  ExtensionProfilView.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 18/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import Foundation
import UIKit


extension ProfilViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionAnchor() {
        self.collectionView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 10).isActive = true
        self.collectionView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.collectionView.heightAnchor.constraint(equalToConstant: 220).isActive = true
        self.collectionView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let listUser = users[indexPath.item]

        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdCo, for: indexPath) as? ProfilCollectionViewCell {
            cell.backgroundColor = .lightGray
            cell.setCell(listUser)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.safeAreaLayoutGuide.layoutFrame.width), height: 320)
    }
}

extension ProfilViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupAnchorTableView() {
        self.tableView.topAnchor.constraint(equalTo: self.labelProject.bottomAnchor, constant: 10).isActive = true
        self.tableView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true

        self.tableViewSkill.topAnchor.constraint(equalTo: self.labelSkill.bottomAnchor, constant: 10).isActive = true
        self.tableViewSkill.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.tableViewSkill.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.tableViewSkill.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.tableViewSkill.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.tableViewSkill.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10).isActive = true
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count: Int?
         
        if tableView == self.tableViewSkill {
            count = skillUser.first(where: { $0.cursus.id == cursus_id})?.skills.count
         }
         if tableView == self.tableView {
             count = projectUser
                .filter { $0.cursus_ids.first == cursus_id && $0.status == "finished" && $0.project.parent_id == nil}.count
         }
         if (count == nil) {
             count = 0
         }
         return count!
    }
 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height: Int = 0
        
        if tableView == self.tableViewSkill {
            height = 50
        }
        if tableView == self.tableView {
            height = 40
        }
        return CGFloat(height)
        
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tableView {
            let newArray = projectUser.filter {$0.cursus_ids.first == cursus_id && $0.status == "finished" && $0.project.parent_id == nil }
            let listProj = newArray[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdTa, for: indexPath) as? ProfilTableViewCell {
                cell.setupCell(project: listProj)
                cell.projectUser = listProj
                return cell
            }
        }
        if tableView == self.tableViewSkill {
            if let skillSelected = skillUser.first(where: { $0.cursus.id == cursus_id}) {

                let listProj = skillSelected.skills[indexPath.row]
                if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdSk, for: indexPath) as? ProfilSkillTableViewCell {
                    cell.setupCell(project: listProj)
                    cell.projectUser = listProj
                    return cell
                }
            }
        }
        return UITableViewCell()
    }
}
