//
//  ViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-24.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 100)
        
        let currentlyLabel = UILabel(frame: CGRect.zero)
        currentlyLabel.textColor = .white
        currentlyLabel.textAlignment = .center
        currentlyLabel.text = "currently:"
        currentlyLabel.font = UIFont(name: "Lato-Bold", size: 21)
        currentlyLabel.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(currentlyLabel)

        NSLayoutConstraint.activate([
            currentlyLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            currentlyLabel.centerYAnchor.constraint(equalTo: self.view.topAnchor, constant: 60)
        ])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        handle = Auth.auth().addStateDidChangeListener{ (auth, user) in
            self.setUser(user)
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }

    
    func setUser(_ user: User?) {
        self.user = user
        print(self.user?.uid)
    }
}

