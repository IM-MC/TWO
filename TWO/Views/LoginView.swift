//
//  LoginView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-27.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension LoginViewController {
    
    func setupView() {
        self.view.addSubview(emailField)
        self.view.addSubview(loginButton)
        
        setupEmailField()
        setupLoginButton()
    }
    
    func setupEmailField() {
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.isUserInteractionEnabled = true
        emailField.frame.size.width = 200
        emailField.frame.size.height = 20
        emailField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 40).isActive = true
        emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func setupPasswordField() {
        
    }
    
    func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isUserInteractionEnabled = true
        loginButton.frame.size.width = 167
        loginButton.frame.size.width = 52
        loginButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 30).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 167).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
}
