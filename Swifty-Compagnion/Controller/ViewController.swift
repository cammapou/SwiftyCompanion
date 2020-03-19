//
//  ViewController.swift
//  Swifty-Compagnion
//
//  Created by Ddales on 11/02/2020.
//  Copyright © 2020 Cammapou. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    var user: User?
    var textlowerCase: String = ""
    
    let buttonLogin = CustomButton()
    let imageBackground = CustomImage()
    let textField = CustomTextFiel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.delegate = self
        self.textField.setTextFiel()
        
        self.buttonLogin.setLoginButton()
        self.buttonLogin.setTitle("Connexion", for: .normal)
        
        self.imageBackground.setImageBackground()
        self.imageBackground.image = UIImage(named: "background_login")
        self.imageBackground.contentMode = .scaleAspectFill
        
        self.view.addSubview(imageBackground)
        self.view.addSubview(textField)
        self.view.addSubview(buttonLogin)
        
        self.setupAnchor()
        self.buttonLogin.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.textlowerCase = (textField.text?.lowercased())!
        self.textlowerCase = self.textlowerCase.trimmingCharacters(in: .whitespaces)
        if self.textlowerCase != "" {
            let newViewcontroller = ProfilViewController()
            APIHelper().getToken { (result, error) in
                if error != nil { print("❌ Error Get Token") }
                guard let token = result else {return print("❌ Error Token")}
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
            }
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func setupAnchor() {
        self.textField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200).isActive = true
        self.textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.textField.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        self.buttonLogin.topAnchor.constraint(equalTo: self.textField.topAnchor, constant: 90).isActive = true
        self.buttonLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.buttonLogin.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        self.imageBackground.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.imageBackground.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.imageBackground.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.imageBackground.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
}
