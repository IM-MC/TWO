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
            let email = UserDefaults.standard.string(forKey: "userEmail") ?? ""
            let password = UserDefaults.standard.string(forKey: "userPassword") ?? ""

            Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
                if err != nil {
                    print(err ?? "Error signing in")
                } else {
                    self.perform(#selector(self.showHomeController), with: nil, afterDelay: 0.01)
                }
            }
        }

        // Do any additional setup after loading the view.
    }
    
    fileprivate func isLoggedIn() -> Bool {
        return false
//        return UserDefaults.standard.bool(forKey: "isLoggedIn")
    }
    
    @objc func showHomeController() {
        let homeController = ViewController()
        self.pushViewController(homeController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
