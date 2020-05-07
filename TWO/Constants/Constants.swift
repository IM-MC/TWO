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
    static let cardBackgroundColor = UIColor.init(red: 39/255, green: 39/255, blue: 39/255, alpha: 1)
    static let startGreen = UIColor.init(red: 91/255, green: 227/255, blue: 87/255, alpha: 1)
    
    static let shadowGrey = UIColor.white.withAlphaComponent(0.5)
    static let shadowGreen = UIColor.init(red: 76/255, green: 255/255, blue: 67/255, alpha: 0.5)
    
    static let divider = UIColor.init(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
    static let divet = UIColor.init(red: 216/255, green: 216/255, blue: 216/255, alpha: 0.23)
    
    struct InputField {
        static let dark = UIColor.init(red: 16/255, green: 16/255, blue: 16/255, alpha: 1)
    }
    
    struct Button {
        static let selected = UIColor.init(red: 33/255, green: 203/255, blue: 97/255, alpha: 1)
        static let orangeBackground = UIColor.init(red: 216/255, green: 98/255, blue: 80/255, alpha: 1)
        static let disabled = UIColor.init(red: 156/255, green: 140/255, blue: 138/255, alpha: 1)
    }
    
    struct Text {
        static let subtle = UIColor.init(red: 145/255, green: 145/255, blue: 145/255, alpha: 1)
        static let highlighted = UIColor.init(red: 223/255, green: 60/255, blue: 101/255, alpha: 1)
    }
    
    struct Input {
        static let background = UIColor.init(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
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
    static let infoBig = UIFont(name: Text.Lato.Bold, size: 21)
    static let infoBigLight = UIFont(name: Text.Lato.Light, size: 21)
    static let infoMed = UIFont(name: Text.Lato.Bold, size: 16)
    static let infoMedLight = UIFont(name: Text.Lato.Light, size: 16)
    static let infoSmall = UIFont(name: Text.Lato.Bold, size: 14)
    static let infoSmallLight = UIFont(name: Text.Lato.Light, size: 14)
    
    static let megaLight = UIFont(name: Text.Lato.Light, size: 33)
    
    struct Button {
        static let big = UIFont(name: Text.Lato.Bold, size: 20)
        static let mega = UIFont(name: Text.Lato.Bold, size: 26)
    }
    
    struct InputField {
        static let title = UIFont(name: Text.Lato.Reg, size: 15)
    }
    
}


// Keys and Value Constants

let kUserEmail = "userEmail"
let kUserPassword = "userPassword"
let kFoodSelection = "foodSelected"
let kIsLoggedIn = "isLoggedIn"

// Datbase Keys
let kdbFirstName = "first_name"
let kdbLastName = "last_name"
let kdbIsFasting = "is_fasting"
let kdbFoodSelection = "food_selection"
let kdbStartTime = "start_time"
let kdbFastsCompleted = "completed_fasts"
let kdbLongestFast = "longest_fast"
let kdbFriends = "friends"
let kdbProfileImg = "profile_pic"

let kFoodValues = [
    0: FoodProp(title: "Popsicle Pwner", slogan: "cool as...", imageProgression: popsicleTransition)
]


struct FoodProp {
    var title: String
    var slogan: String
    var imageProgression: [UIImage]
}


let popsicleTransition = [ #imageLiteral(resourceName: "PopsicleFull"), #imageLiteral(resourceName: "Popsicle2"), #imageLiteral(resourceName: "Popsicle3"), #imageLiteral(resourceName: "Popsicle4"), #imageLiteral(resourceName: "Popsicle5"), #imageLiteral(resourceName: "Popsicle6") ]
