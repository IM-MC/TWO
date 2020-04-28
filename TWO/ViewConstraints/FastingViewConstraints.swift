//
//  FastView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-28.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension FastingView {
    
    func setupView() {
        self.addSubview(currentlyLabel)
        self.addSubview(statusLabel)
        self.addSubview(titleLabel)
        self.addSubview(motivationLabel)
        
        setupCurrentlyLabel()
        setupStatusLabel()
        setupTitleLabel()
        setupMotivationLabel()
        
    }
    
    func setupCurrentlyLabel() {
        currentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        currentlyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentlyLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 100).isActive = true
    }
    
    func setupStatusLabel() {
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: currentlyLabel.bottomAnchor, constant: 0).isActive = true
    }
    
    func setupTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 11).isActive = true
    }
    
    func setupMotivationLabel() {
        motivationLabel.translatesAutoresizingMaskIntoConstraints = false
        motivationLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        motivationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
    }
}
