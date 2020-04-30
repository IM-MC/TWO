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
        self.view.addSubview(exitButton)
        
        setupExitButton()
    }
    
    func setupExitButton() {
        exitButton.translatesAutoresizingMaskIntoConstraints = false
        exitButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 61).isActive = true
        exitButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 21).isActive = true
        exitButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        exitButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
    }
}
