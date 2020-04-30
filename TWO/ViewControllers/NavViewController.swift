//
//  NavViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-27.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class NavViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if isLoggedIn() {
            let email = UserDefaults.standard.string(forKey: kUserEmail) ?? ""
            let password = UserDefaults.standard.string(forKey: kUserPassword) ?? ""

            Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
                if err != nil {
                    print(err ?? "Error signing in")
                } else {
                    self.perform(#selector(self.showHomeController), with: nil, afterDelay: 0.01)
                }
            }
        }
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: kIsLoggedIn)
    }
    
    @objc func showHomeController() {
        let homeController = FastViewController()
        self.pushViewController(homeController, animated: true)
    }
}
