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
        self.setupView()
    }
    
    func setupView() {
        if let uid = self.user?.uid {
            let fastView = FastingView(uid: uid)
            
            self.view.addSubview(fastView)
            
            fastView.translatesAutoresizingMaskIntoConstraints = false
            fastView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            fastView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        } else {
            return // Error
        }
        
    }
}

