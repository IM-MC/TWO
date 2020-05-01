//
//  ConsumptionViewConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-30.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension ConsumptionView {
    
    func setupView() {
        self.addSubview(foodImageView)
        self.addSubview(elapsedLabel)
        self.addSubview(elapsedPercent)
        self.addSubview(elapsedTime)
        self.addSubview(remainingLabel)
        self.addSubview(remainingPercent)
        self.addSubview(remainingTime)
        
        setupFoodImage()
        setupElapsed()
        setupRemaining()
    }
    
    func setupFoodImage() {
        foodImageView.translatesAutoresizingMaskIntoConstraints = false
        foodImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        foodImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        foodImageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        foodImageView.heightAnchor.constraint(equalToConstant: 151).isActive = true
    }
    
    func setupElapsed() {
        elapsedLabel.translatesAutoresizingMaskIntoConstraints = false
        elapsedLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        elapsedLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 14).isActive = true
        elapsedLabel.widthAnchor.constraint(equalToConstant: 77).isActive = true
        elapsedLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        elapsedPercent.translatesAutoresizingMaskIntoConstraints = false
        elapsedPercent.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        elapsedPercent.leftAnchor.constraint(equalTo: elapsedLabel.rightAnchor, constant: 1).isActive = true
        elapsedPercent.widthAnchor.constraint(equalToConstant: 63).isActive = true
        elapsedLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        elapsedTime.translatesAutoresizingMaskIntoConstraints = false
        elapsedTime.topAnchor.constraint(equalTo: elapsedLabel.bottomAnchor, constant: 2).isActive = true
        elapsedTime.leftAnchor.constraint(equalTo: elapsedLabel.leftAnchor).isActive = true
        elapsedTime.widthAnchor.constraint(equalToConstant: 132).isActive = true
        elapsedTime.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func setupRemaining() {
        remainingLabel.translatesAutoresizingMaskIntoConstraints = false
        remainingLabel.leftAnchor.constraint(equalTo: foodImageView.rightAnchor, constant: 28.5).isActive = true
        remainingLabel.topAnchor.constraint(equalTo: elapsedTime.bottomAnchor, constant: 28).isActive = true
        remainingLabel.widthAnchor.constraint(equalToConstant: 65).isActive = true
        remainingLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        remainingPercent.translatesAutoresizingMaskIntoConstraints = false
        remainingPercent.leftAnchor.constraint(equalTo: remainingLabel.rightAnchor, constant: 1).isActive = true
        remainingPercent.topAnchor.constraint(equalTo: remainingLabel.topAnchor).isActive = true
        remainingPercent.widthAnchor.constraint(greaterThanOrEqualToConstant: 36).isActive = true
        remainingPercent.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        remainingTime.translatesAutoresizingMaskIntoConstraints = false
        remainingTime.topAnchor.constraint(equalTo: remainingLabel.bottomAnchor, constant: 2).isActive = true
        remainingTime.widthAnchor.constraint(equalToConstant: 103).isActive = true
        remainingTime.leftAnchor.constraint(equalTo: remainingLabel.leftAnchor).isActive = true
        remainingTime.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
}
