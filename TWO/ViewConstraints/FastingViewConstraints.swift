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
        self.addSubview(placeholderView)
        self.addSubview(startStopButton)
        self.addSubview(fastInfoView)
        
        setupCurrentlyLabel()
        setupStatusLabel()
        setupTitleLabel()
        setupMotivationLabel()
        setupPlaceholder()
        setupStartStop()
        setupFastInfo()
    }
    
    func setupCurrentlyLabel() {
        currentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        currentlyLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        currentlyLabel.centerYAnchor.constraint(equalTo: self.topAnchor, constant: 60).isActive = true
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
    
    func setupPlaceholder() {
        placeholderView.translatesAutoresizingMaskIntoConstraints = false
        placeholderView.widthAnchor.constraint(equalToConstant: 226).isActive = true
        placeholderView.heightAnchor.constraint(equalToConstant: 151).isActive = true
        placeholderView.topAnchor.constraint(equalTo: motivationLabel.bottomAnchor, constant: 27).isActive = true
        placeholderView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    func setupStartStop() {
        startStopButton.translatesAutoresizingMaskIntoConstraints = false
        startStopButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        startStopButton.topAnchor.constraint(equalTo: placeholderView.bottomAnchor, constant: 40).isActive = true
        startStopButton.widthAnchor.constraint(equalToConstant: 167).isActive = true
        startStopButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    func setupFastInfo() {
        fastInfoView.translatesAutoresizingMaskIntoConstraints = false
        fastInfoView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        fastInfoView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        fastInfoView.widthAnchor.constraint(greaterThanOrEqualToConstant: 327).isActive = true
        fastInfoView.topAnchor.constraint(equalTo: startStopButton.bottomAnchor, constant: 25).isActive = true
        
    }
}
