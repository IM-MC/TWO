//
//  ViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-24.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class FastViewController: UIViewController {
    
    var handle: AuthStateDidChangeListenerHandle?
    var user: User?
    
    lazy var contentViewSize = CGSize(width: self.view.frame.width, height: 600)
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .clear
        view.contentSize = contentViewSize
        return view
    }()
    
    let exitButton: UIButton = {
        let image = #imageLiteral(resourceName: "ExitIcon")
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(popToRoot), for: .touchUpInside)
        return button
    }()

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
        setupView()
        self.configureView()
    }
    
    func configureView() {
        if let uid = self.user?.uid {
            let fastView = FastingView(uid: uid)
            scrollView.addSubview(fastView)
            scrollView.bringSubview(toFront: exitButton)
            
            fastView.translatesAutoresizingMaskIntoConstraints = false
            fastView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            fastView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            fastView.heightAnchor.constraint(greaterThanOrEqualToConstant: 515).isActive = true
        } else {
            return // Error
        }
    }
    
    @objc func popToRoot(sender: UIButton) {
        UserDefaults.standard.set(false, forKey: kIsLoggedIn)
        UserDefaults.standard.synchronize()
        self.navigationController?.popToRootViewController(animated: true)
    }
}
