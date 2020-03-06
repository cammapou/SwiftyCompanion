//
//  ViewController.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 11/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var token: Token?
    var user: User?
    var textlowerCase: String = ""
    let buttonLogin = CustomButton()
    
    
    var imageBackground: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let text: UITextField = {
        let textField = UITextField()
        textField.placeholder = "   Login"
        textField.textAlignment = .left
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.tintColor = .lightGray
        textField.layer.cornerRadius = 5
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        self.text.delegate = self
        self.buttonLogin.setLoginButton()
        self.buttonLogin.setTitle("Connexion", for: .normal)
        self.imageBackground.image = UIImage(named: "background_login")
        self.imageBackground.contentMode = .scaleAspectFill
        
        self.view.addSubview(imageBackground)
        self.view.addSubview(text)
        self.view.addSubview(buttonLogin)
        
        self.setupAnchor()
        self.buttonLogin.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.textlowerCase = (text.text?.lowercased())!
        if textlowerCase != "" {
            let newViewcontroller = ProfilViewController()
            APIHelper().getToken { (result, error) in
                if error != nil { print("❌ Error Token") }
                guard let token = result else {return print("❌ Error Token")}
                self.token = token
                    
                APIHelper().getUsers(login: self.textlowerCase, token: token.token) { (user, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "User not found", message: "Please enter a valid login", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alert, animated: true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            newViewcontroller.token = token
                            newViewcontroller.users.append(user!)
                            newViewcontroller.projectUser.append(contentsOf: user!.projectsUser)
                            newViewcontroller.skillUser.append(contentsOf: user!.cursusUser)
                            newViewcontroller.modalPresentationStyle = .fullScreen
                            self.present(newViewcontroller, animated: true, completion: nil)
                        }
                    }
                }
                APIHelper().getCoa(login: self.textlowerCase, token: token.token) { (coa, error) in
                    if error != nil {
                        DispatchQueue.main.async {
                            let alert = UIAlertController(title: "User not Coalition", message: "User don't have a coalition", preferredStyle: .alert)
                            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alert, animated: true)
                        }
                    } else {
                        DispatchQueue.main.async {
                            newViewcontroller.coalitionUser.append(contentsOf: coa!)
                        }

                    }
                }
            }
        }
    }
    
    @objc private func hideKeyboard() {
        self.text.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func setupAnchor() {
        
        self.text.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.text.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.text.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.text.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        
        self.buttonLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.buttonLogin.topAnchor.constraint(equalTo: self.text.topAnchor, constant: 90).isActive = true
        self.buttonLogin.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.imageBackground.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        self.imageBackground.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        self.imageBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.imageBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        
    }
}
