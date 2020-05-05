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
        
        setupCardView()
    }
    
    func setupCardView() {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.widthAnchor.constraint(equalToConstant: 395).isActive = true
        cardView.heightAnchor.constraint(equalTo: self.view.heightAnchor).isActive = true
        cardView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        cardView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
    
}
