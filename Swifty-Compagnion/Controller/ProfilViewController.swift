//
//  ProfilViewController.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 18/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    
    var cellIdCo = "profilCollectionViewCell"
    let cellIdTa = "profilTableViewCell"
    var users: [User] = []
    var projectUser: [ProjectsUser] = []
    var token: Token?
    var buttonBack = CustomButton()
    var cursus_id: Int = 1
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.clipsToBounds = false
        return collection
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.tableView.register(ProfilTableViewCell.self, forCellReuseIdentifier: cellIdTa)
        self.collectionView.register(ProfilCollectionViewCell.self, forCellWithReuseIdentifier: cellIdCo)
        
        self.buttonBack.setButton()
        self.buttonBack.setImage(UIImage(named: "return"), for: .normal)
        self.view.addSubview(buttonBack)
        self.view.addSubview(collectionView)
        self.view.addSubview(tableView)
        self.setupCollectionAnchor()
        self.setupAnchorTableView()
        initUser()
        setAnchor()
        self.buttonBack.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        dismiss(animated: false, completion: nil)
    }

    func initUser() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.tableView.reloadData()
        }
    }
    
    func setAnchor() {
        self.buttonBack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.buttonBack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.buttonBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.buttonBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
}





