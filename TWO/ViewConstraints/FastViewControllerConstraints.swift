//
//  FastViewControllerConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-30.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension FastViewController {
    
    func setupView() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(exitButton)
        
        setupScrollView()
        setupExitButton()
    }
    
    func setupScrollView() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        scrollView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8).isActive = true
    }
    func setupExitButton() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 21).isActive = true
        exitButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 21).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
