//
//  FoodSelection.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-29.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class FoodSelection: UIButton {

    required init(image: UIImage) {
        super.init(frame: .zero)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 16
        self.setImage(image, for: .normal)
        self.backgroundColor = .clear
        
        self.imageEdgeInsets = UIEdgeInsets(top: 18, left: 25, bottom: 18, right: 25)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
