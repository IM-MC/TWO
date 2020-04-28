//
//  LoginViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-26.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoView: UIImageView!
    
    let emailField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Email"
        textfield.textColor = .white
        textfield.textAlignment = .center
        textfield.autocapitalizationType = .none
        return textfield
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 26
        button.backgroundColor = UIColor.init(red: 1, green: 173/255, blue: 99/255, alpha: 1)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Lato-Bold", size: 20)
        button.addTarget(self, action: #selector(onLoginButtonPress), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    @objc func onLoginButtonPress(sender: UIButton) {
        let email = emailField.text!
        let password = "tester"
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                print(err)
            } else {
                self.navigationController?.pushViewController(ViewController(), animated: true)
                
                UserDefaults.standard.set(true, forKey: "isLoggedIn")
                UserDefaults.standard.set(email, forKey: "userEmail")
                UserDefaults.standard.set(password, forKey: "userPassword")
                UserDefaults.standard.synchronize()
            }
        }
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
