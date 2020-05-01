//
//  FoodProps.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-30.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation
import UIKit

class FoodProp {
    var title: String
    var slogan: String
    var image: UIImage
    
    required init(title: String, slogan: String, image: UIImage) {
        self.title = title
        self.slogan = slogan
        self.image = image
    }
}
