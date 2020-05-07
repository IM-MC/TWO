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
        self.view.addSubview(passwordField)
        self.view.addSubview(loginButton)
        self.view.addSubview(signUpButton)
        self.view.addSubview(errorPropButton)
        errorPropButton.alpha = 0
        
        setupEmailField()
        setupPasswordField()
        setupSignUpButton()
        setupLoginButton()
        setupError()
    }
    
    func setupEmailField() {
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.isUserInteractionEnabled = true
        emailField.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 47).isActive = true
        emailField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 353).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    func setupPasswordField() {
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.isUserInteractionEnabled = true
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 14).isActive = true
        passwordField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: 353).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 58).isActive = true
    }
    
    func setupLoginButton() {
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.isUserInteractionEnabled = true
        loginButton.bottomAnchor.constraint(equalTo: signUpButton.topAnchor, constant: -9).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 351).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.isUserInteractionEnabled = true
        signUpButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -31).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signUpButton.widthAnchor.constraint(equalToConstant: 351).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func setupError() {
        errorPropButton.translatesAutoresizingMaskIntoConstraints = false
        errorPropButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20).isActive = true
        errorPropButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        errorPropButton.widthAnchor.constraint(equalToConstant: 117).isActive = true
        errorPropButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
    }
}
