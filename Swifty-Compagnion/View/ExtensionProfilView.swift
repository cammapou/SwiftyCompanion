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
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 200).isActive = true
      //  collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
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
        self.tableView.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 100).isActive = true
        self.tableView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.tableView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = projectUser.filter {$0.cursus_ids.first == cursus_id && $0.status == "finished" && $0.project.parent_id == nil }.count
        print(count)
        return count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let newArray = projectUser.filter {$0.cursus_ids.first == cursus_id && $0.status == "finished" && $0.project.parent_id == nil }
        let listProj = newArray[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdTa, for: indexPath) as? ProfilTableViewCell {
            cell.setupCell(project: listProj)
            cell.projectUser = listProj
            return cell
        }
        return UITableViewCell()
    }
}
