//
//  FriendTableViewCellConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-05.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension FriendTableViewCell {
    
    func setupView() {
        self.addSubview(imgView)
        self.addSubview(nameLabel)
        self.addSubview(subtitleLabel)
        self.addSubview(fastCountLabel)
        self.addSubview(timerImage)
        timerImage.alpha = 0
        
        setupImg()
        setupName()
        setupSubtitle()
        setupFastCount()
        setupTimer()
    }
    
    func setupImg() {
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.widthAnchor.constraint(equalToConstant: 78).isActive = true
        imgView.heightAnchor.constraint(equalToConstant: 78).isActive = true
        imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: 9).isActive = true
    }
    
    func setupName() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 25).isActive = true
        nameLabel.topAnchor.constraint(equalTo: imgView.topAnchor, constant: 9).isActive = true
        nameLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 220).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupSubtitle() {
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subtitleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 105).isActive = true
        subtitleLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func setupFastCount() {
        fastCountLabel.translatesAutoresizingMaskIntoConstraints = false
        fastCountLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor).isActive = true
        fastCountLabel.leftAnchor.constraint(equalTo: subtitleLabel.leftAnchor).isActive = true
        fastCountLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 130).isActive = true
        fastCountLabel.heightAnchor.constraint(equalToConstant: 19).isActive = true
    }
    
    func setupTimer() {
        timerImage.translatesAutoresizingMaskIntoConstraints = false
        timerImage.widthAnchor.constraint(equalToConstant: 25).isActive = true
        timerImage.heightAnchor.constraint(equalToConstant: 27).isActive = true
        timerImage.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        timerImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
    }
}
