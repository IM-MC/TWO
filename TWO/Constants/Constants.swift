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
    
    struct InputField {
        static let dark = UIColor.init(red: 16/255, green: 16/255, blue: 16/255, alpha: 1)
    }
    
    struct Button {
        static let selected = UIColor.init(red: 33/255, green: 203/255, blue: 97/255, alpha: 1)
        static let orangeBackground = UIColor.init(red: 216/255, green: 98/255, blue: 80/255, alpha: 1)
        static let disabled = UIColor.init(red: 156/255, green: 140/255, blue: 138/255, alpha: 1)
    }
    
}


struct Text {
    
    struct Lato {
        static let Reg = "Lato-Regular"
        static let Bold = "Lato-Bold"
        static let Light = "Lato-Light"
    }

}

struct Font {
    
    static let title = UIFont(name: Text.Lato.Bold, size: 29)
    
    struct Button {
        static let big = UIFont(name: Text.Lato.Bold, size: 20)
    }
    
    struct InputField {
        static let title = UIFont(name: Text.Lato.Reg, size: 15)
    }
    
}
