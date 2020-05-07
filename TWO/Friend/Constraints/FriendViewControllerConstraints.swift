//
//  FriendViewControllerConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-04.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension FriendViewController {
    
    func setupView() {
        self.view.addSubview(cardView)
        cardView.addSubview(cardDivet)
        cardView.addSubview(titleLabel)
        cardView.addSubview(divider)
        cardView.addSubview(tableView)
        cardView.addSubview(addFriendButton)
        
        setupCardView()
        setupTitle()
        setupTableView()
        setupAddButton()
    }
    
    func setupCardView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.widthAnchor.constraint(equalToConstant: 395).isActive = true
        cardView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        cardDivet.translatesAutoresizingMaskIntoConstraints = false
        cardDivet.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        cardDivet.widthAnchor.constraint(equalToConstant: 65).isActive = true
        cardDivet.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 13).isActive = true
        cardDivet.heightAnchor.constraint(equalToConstant: 4).isActive = true
    }
    
    func setupTitle() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 28).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: cardView.leftAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 67).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        divider.widthAnchor.constraint(equalToConstant: 374).isActive = true
        divider.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        divider.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
    }
    
    func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 9).isActive = true
        tableView.leftAnchor.constraint(equalTo: cardView.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: cardView.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor).isActive = true
    }
    
    func setupAddButton() {
        addFriendButton.translatesAutoresizingMaskIntoConstraints = false
        addFriendButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
        addFriendButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        addFriendButton.centerXAnchor.constraint(equalTo: cardView.centerXAnchor).isActive = true
        addFriendButton.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -140).isActive = true
    }
    
}
