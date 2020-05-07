//
//  AddFriendViewControllerConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-06.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension AddFriendViewController {
    
    func setupView() {
        self.view.addSubview(bgButton)
        self.view.addSubview(prompt)
        
        setupBG()
        setupPrompt()
    }
    
    func setupBG() {
        bgButton.translatesAutoresizingMaskIntoConstraints = false
        bgButton.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        bgButton.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
    }
    
    func setupPrompt() {
        prompt.translatesAutoresizingMaskIntoConstraints = false
        prompt.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        prompt.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        prompt.widthAnchor.constraint(equalToConstant: 242).isActive = true
        prompt.heightAnchor.constraint(equalToConstant: 199).isActive = true
    }
}
