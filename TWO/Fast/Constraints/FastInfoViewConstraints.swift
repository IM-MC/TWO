//
//  FastInfoViewConstraints.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-02.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation

extension FastInfoView {
    
    func setupView() {
        self.addSubview(leftLabelTitle)
        self.addSubview(leftLabelInfo)
        self.addSubview(dividerView)
        self.addSubview(rightLabelTitle)
        self.addSubview(rightLabelInfo)
        
        setupDivider()
        setupLeftInfo()
        setupRightInfo()
    }
    
    func setupDivider() {
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        dividerView.widthAnchor.constraint(equalToConstant: 1).isActive = true
        dividerView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dividerView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
    }
    
    func setupLeftInfo() {
        leftLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        leftLabelTitle.centerXAnchor.constraint(equalTo: dividerView.leftAnchor, constant: -94).isActive = true
        leftLabelTitle.widthAnchor.constraint(lessThanOrEqualToConstant: 110).isActive = true
        leftLabelTitle.heightAnchor.constraint(equalToConstant: 19).isActive = true
        leftLabelTitle.topAnchor.constraint(equalTo: dividerView.topAnchor, constant: 10).isActive = true
        
        leftLabelInfo.translatesAutoresizingMaskIntoConstraints = false
        leftLabelInfo.centerXAnchor.constraint(equalTo: leftLabelTitle.centerXAnchor).isActive = true
        leftLabelInfo.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        leftLabelInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        leftLabelInfo.topAnchor.constraint(equalTo: leftLabelTitle.bottomAnchor, constant: 1).isActive = true
    }
    
    func setupRightInfo() {
        rightLabelTitle.translatesAutoresizingMaskIntoConstraints = false
        rightLabelTitle.centerXAnchor.constraint(equalTo: dividerView.rightAnchor, constant: 94).isActive = true
        rightLabelTitle.topAnchor.constraint(equalTo: dividerView.topAnchor, constant: 10).isActive = true
        rightLabelTitle.heightAnchor.constraint(equalToConstant: 19).isActive = true
        
        rightLabelInfo.translatesAutoresizingMaskIntoConstraints = false
        rightLabelInfo.centerXAnchor.constraint(equalTo: rightLabelTitle.centerXAnchor).isActive = true
        rightLabelInfo.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        rightLabelInfo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        rightLabelInfo.topAnchor.constraint(equalTo: rightLabelTitle.bottomAnchor, constant: 1).isActive = true
    }
    
}
