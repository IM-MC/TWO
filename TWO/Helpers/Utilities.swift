//
//  Utilities.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-27.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    // style textfields (login pages)
    static func styleTextField(_ textfield: UITextField) {
        //create bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height-2, width: textfield.frame.width, height: 2)
        print(textfield.frame)
        bottomLine.backgroundColor = UIColor.init(red: 255/255,
                                                  green: 173/255,
                                                  blue: 99/255,
                                                  alpha: 1).cgColor
        
        textfield.borderStyle = .none
        textfield.layer.addSublayer(bottomLine)
    }
}
