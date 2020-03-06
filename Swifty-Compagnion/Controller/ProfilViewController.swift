//
//  ProfilViewController.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 18/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ProfilViewController: UIViewController {
    
    let cellIdCo = "profilCollectionViewCell"
    let cellIdTa = "profilTableProj"
    let cellIdSk = "profilTableSkill"
    var users: [User] = []
    var projectUser: [ProjectsUser] = []
    var skillUser: [CursusUser] = []
    var coalitionUser: [Coalition] = []
    var token: Token?
    var buttonBack = CustomButton()
    var cursus_id: Int = 1
    let labelProject = CustomLabel()
    let labelSkill = CustomLabel()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.white
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = false
        collection.clipsToBounds = false
        return collection
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.isEditing = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    let tableViewSkill: UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.white
        table.isEditing = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    let scrollView: UIScrollView = {
        var scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = .white
        scroll.isScrollEnabled = true
        scroll.contentSize.height = 900
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelProject.setLabelTitle()
        self.labelProject.text = "Projects"
        self.labelSkill.setLabelTitle()
        self.labelSkill.text = "Skills"
        
        self.view.backgroundColor = .white
        self.collectionView.backgroundColor = .white
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableViewSkill.delegate = self
        self.tableViewSkill.dataSource = self
        
        self.tableViewSkill.register(ProfilSkillTableViewCell.self, forCellReuseIdentifier: cellIdSk)
        self.tableView.register(ProfilTableViewCell.self, forCellReuseIdentifier: cellIdTa)
        self.collectionView.register(ProfilCollectionViewCell.self, forCellWithReuseIdentifier: cellIdCo)
        
        self.buttonBack.setButton()
        self.buttonBack.setImage(UIImage(named: "return"), for: .normal)
      
     
        self.view.addSubview(scrollView)
        self.view.addSubview(buttonBack)

        self.scrollView.addSubview(collectionView)
        self.scrollView.addSubview(labelProject)
        self.scrollView.addSubview(labelSkill)
        
        self.scrollView.addSubview(tableView)
        self.scrollView.addSubview(tableViewSkill)
        
        self.setupCollectionAnchor()
        self.setupAnchorTableView()
        
        self.initUser()
        self.setAnchor()
        self.buttonBack.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        dismiss(animated: false, completion: nil)
    }

    func initUser() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            self.tableView.reloadData()
            self.tableViewSkill.reloadData()
        }
    }
    
    func setAnchor() {
        
        
        self.scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.scrollView.topAnchor.constraint(equalTo: buttonBack.bottomAnchor, constant: 10).isActive = true
        self.scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        self.scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
         
     
        self.buttonBack.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.buttonBack.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.buttonBack.heightAnchor.constraint(equalToConstant: 30).isActive = true
        self.buttonBack.widthAnchor.constraint(equalToConstant: 30).isActive = true
    
        self.labelProject.topAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: 130).isActive = true
        self.labelProject.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                
        self.labelSkill.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 20).isActive = true
        self.labelSkill.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
}
