//
//  AddFriendPromptConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-06.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension AddFriendPrompt {
    
    func setupView() {
        self.addSubview(titleText)
        self.addSubview(divider)
        self.addSubview(userFriendText)
        self.addSubview(friendCode)
        self.addSubview(friendCodeText)
        self.addSubview(friendCodeField)
        self.addSubview(addButton)
        
        setupTitle()
        setupUserFriendCode()
        setupFriendCode()
    }
    
    func setupTitle() {
        titleText.translatesAutoresizingMaskIntoConstraints = false
        titleText.widthAnchor.constraint(equalToConstant: 105).isActive = true
        titleText.heightAnchor.constraint(equalToConstant: 25).isActive = true
        titleText.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 210).isActive = true
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.topAnchor.constraint(equalTo: titleText.bottomAnchor, constant: 3).isActive = true
    }
    
    func setupUserFriendCode() {
        userFriendText.translatesAutoresizingMaskIntoConstraints = false
        userFriendText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        userFriendText.widthAnchor.constraint(equalToConstant: 140).isActive = true
        userFriendText.heightAnchor.constraint(equalToConstant: 23).isActive = true
        userFriendText.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 16).isActive = true
        
        friendCode.translatesAutoresizingMaskIntoConstraints = false
        friendCode.widthAnchor.constraint(greaterThanOrEqualToConstant: 205).isActive = true
        friendCode.heightAnchor.constraint(equalToConstant: 17).isActive = true
        friendCode.topAnchor.constraint(equalTo: userFriendText.bottomAnchor, constant: 6).isActive = true
        friendCode.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupFriendCode() {
        friendCodeText.translatesAutoresizingMaskIntoConstraints = false
        friendCodeText.topAnchor.constraint(equalTo: friendCode.bottomAnchor, constant: 25).isActive = true
        friendCodeText.widthAnchor.constraint(greaterThanOrEqualToConstant: 114).isActive = true
        friendCodeText.heightAnchor.constraint(equalToConstant: 23).isActive = true
        friendCodeText.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        friendCodeField.translatesAutoresizingMaskIntoConstraints = false
        friendCodeField.widthAnchor.constraint(equalToConstant: 179).isActive = true
        friendCodeField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        friendCodeField.topAnchor.constraint(equalTo: friendCodeText.bottomAnchor, constant: 7).isActive = true
        friendCodeField.heightAnchor.constraint(equalToConstant: 28).isActive = true
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.widthAnchor.constraint(equalToConstant: 33).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        addButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -18).isActive = true
        addButton.topAnchor.constraint(equalTo: friendCodeField.topAnchor).isActive = true
    }
}
