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
    
    let emailField: InputFieldView = {
        let textfield = InputFieldView(title: "Email", isSecure: false, autoCapType: .none)
        return textfield
    }()
    
    let passwordField: InputFieldView = {
        let textfield = InputFieldView(title: "Password", isSecure: true, autoCapType: .none)
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = Colors.appPrimaryColor
        button.setTitle("Login", for: .normal)
        button.setTitleColor(Colors.appBackgroundColor, for: .normal)
        button.titleLabel?.font = Font.Button.big
        button.addTarget(self, action: #selector(onLoginButtonPress), for: .touchUpInside)
        return button
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = Colors.appPrimaryColor.cgColor
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(Colors.appPrimaryColor, for: .normal)
        button.titleLabel?.font = Font.Button.big
        button.addTarget(self, action: #selector(onSignUpButtonPress), for: .touchUpInside)
        return button
    }()
    
    let errorPropButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.error
        button.setTitle("Invalid Login!", for: .normal)
        button.titleLabel?.font = Font.infoMedReg
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func onLoginButtonPress(sender: UIButton) {
        let spinner = SpinnerViewController()
        let email = emailField.textField.text ?? ""
        let password = passwordField.textField.text ?? ""
        
        self.addChildViewController(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParentViewController: self)
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            spinner.willMove(toParentViewController: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParentViewController()
            if err != nil {
                print("Error signing in")
                self.errorPropButton.alpha = 1
            } else {
                self.navigationController?.pushViewController(FastViewController(), animated: true)
                
                
                // Restore textfields
                self.emailField.textField.text = ""
                self.passwordField.textField.text = ""
                
                UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                UserDefaults.standard.set(email, forKey: kUserEmail)
                UserDefaults.standard.set(password, forKey: kUserPassword)
                UserDefaults.standard.synchronize()
                self.errorPropButton.alpha = 0
            }
        }
    }
    
    @objc func onSignUpButtonPress(sender: UIButton) {
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
        
        // Restore textfields
        self.emailField.textField.text = ""
        self.passwordField.textField.text = ""
    }
}
