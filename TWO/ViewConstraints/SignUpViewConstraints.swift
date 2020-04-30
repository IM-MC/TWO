//
//  SignUpViewConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-29.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension SignUpViewController {
    
    func setupView() {
        self.view.addSubview(titleImage)
        self.view.addSubview(firstNameField)
        self.view.addSubview(lastNameField)
        self.view.addSubview(emailField)
        self.view.addSubview(passwordField)
        self.view.addSubview(optionTitle)
        self.view.addSubview(popsicleSelection)
        self.view.addSubview(signUpButton)
        self.view.addSubview(cancelButton)
                        
        setupTitle()
        setupFirstName()
        setupLastName()
        setupEmail()
        setupPassword()
        setupOptionTitle()
        setupPopsicle()
        setupCancelButton()
        setupSignUpButton()
    }
    
    
    func setupTitle() {
        titleImage.translatesAutoresizingMaskIntoConstraints = false
        titleImage.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        titleImage.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 64).isActive = true
        titleImage.widthAnchor.constraint(equalToConstant: 313).isActive = true
        titleImage.heightAnchor.constraint(equalToConstant: 103).isActive = true
    }
    
    func setupFirstName() {
        firstNameField.translatesAutoresizingMaskIntoConstraints = false
        firstNameField.topAnchor.constraint(equalTo: titleImage.bottomAnchor, constant: 35).isActive = true
        firstNameField.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        firstNameField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        firstNameField.widthAnchor.constraint(equalToConstant: 353).isActive = true
    }
    
    func setupLastName() {
        lastNameField.translatesAutoresizingMaskIntoConstraints = false
        lastNameField.topAnchor.constraint(equalTo: firstNameField.bottomAnchor, constant: 10).isActive = true
        lastNameField.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        lastNameField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        lastNameField.widthAnchor.constraint(equalToConstant: 353).isActive = true
    }
    
    func setupEmail() {
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.topAnchor.constraint(equalTo: lastNameField.bottomAnchor, constant: 10).isActive = true
        emailField.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        emailField.widthAnchor.constraint(equalToConstant: 353).isActive = true
    }
    
    func setupPassword() {
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 10).isActive = true
        passwordField.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        passwordField.heightAnchor.constraint(equalToConstant: 58).isActive = true
        passwordField.widthAnchor.constraint(equalToConstant: 353).isActive = true
    }
    
    func setupOptionTitle() {
        optionTitle.translatesAutoresizingMaskIntoConstraints = false
        optionTitle.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 35).isActive = true
        optionTitle.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        optionTitle.widthAnchor.constraint(equalToConstant: 217).isActive = true
        optionTitle.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func setupPopsicle() {
        popsicleSelection.translatesAutoresizingMaskIntoConstraints = false
        popsicleSelection.topAnchor.constraint(equalTo: optionTitle.bottomAnchor, constant: 15).isActive = true
        popsicleSelection.leftAnchor.constraint(equalTo: titleImage.leftAnchor).isActive = true
        popsicleSelection.widthAnchor.constraint(equalToConstant: 102).isActive = true
        popsicleSelection.heightAnchor.constraint(equalToConstant: 135).isActive = true
    }
    
    func setupCancelButton() {
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.widthAnchor.constraint(equalToConstant: 351).isActive = true
        cancelButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cancelButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -37).isActive = true
    }
    
    func setupSignUpButton() {
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.widthAnchor.constraint(equalToConstant: 351).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        signUpButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signUpButton.bottomAnchor.constraint(equalTo: cancelButton.topAnchor, constant: -9).isActive = true
    }
}
