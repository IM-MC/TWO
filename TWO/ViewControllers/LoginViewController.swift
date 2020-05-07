//
//  LoginViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-26.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIImageView!
    
    let emailField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.textColor = .white
        textfield.textAlignment = .center
        textfield.autocapitalizationType = .none
        return textfield
    }()
    
    let passwordField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Password"
        textfield.textColor = .white
        textfield.textAlignment = .center
        textfield.autocapitalizationType = .none
        textfield.isSecureTextEntry = true
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 26
        button.backgroundColor = Colors.appPrimaryColor
        button.setTitle("Login", for: .normal)
        button.setTitleColor(Colors.appBackgroundColor, for: .normal)
        button.titleLabel?.font = Font.Button.big
        button.addTarget(self, action: #selector(onLoginButtonPress), for: .touchUpInside)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 26
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.appPrimaryColor.cgColor
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(Colors.appPrimaryColor, for: .normal)
        button.titleLabel?.font = Font.Button.big
        button.addTarget(self, action: #selector(onSignUpButtonPress), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func onLoginButtonPress(sender: UIButton) {
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                print(err ?? "Error signing in")
            } else {
                self.navigationController?.pushViewController(FastViewController(), animated: true)
                
                
                // Restore textfields
                self.emailField.text = ""
                self.passwordField.text = ""
                
                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                UserDefaults.standard.set(email, forKey: kUserEmail)
                UserDefaults.standard.set(password, forKey: kUserPassword)
                UserDefaults.standard.synchronize()
            }
        }
    }
    
    @objc func onSignUpButtonPress(sender: UIButton) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
        
        // Restore textfields
        self.emailField.text = ""
        self.passwordField.text = ""
    }
}
