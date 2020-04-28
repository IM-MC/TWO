//
//  Constants.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-28.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

struct Colors {
    
    static let appPrimaryColor = UIColor.init(red: 1, green: 173/255, blue: 99/255, alpha: 1)
    static let appBackgroundColor = UIColor.init(red: 25/255, green: 26/255, blue: 26/255, alpha: 1)
    
}


struct Text {
    
    struct Lato {
        static let Reg = "Lato-Regular"
        static let Bold = "Lato-Bold"
        static let Light = "Lato-Light"
    }

}

struct Font {
    
    struct Button {
        static let big = UIFont(name: Text.Lato.Bold, size: 20)
    }
    
}
