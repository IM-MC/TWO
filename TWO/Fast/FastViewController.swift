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
    
    let db = Firestore.firestore()
    var handle: AuthStateDidChangeListenerHandle?
    var user: User?
    var friends = [String]()
    
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
            self.setupView()
            self.configureView()
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    func setUser(_ user: User?) {
        self.user = user
    }

    // get friend data from firestore
    func grabData() {
        let docRef = db.collection("users").document(self.user!.uid)
        
        docRef.getDocument { (doc, err) in
            if let doc = doc, doc.exists {
                self.friends = doc.get(kdbFriends) as! [String]
                self.addFriendView()
            } else {
                print("Error retrieving doc")
            }
        }
    }
    
    func configureView() {
        if let uid = self.user?.uid {
            grabData()
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
    
    func addFriendView() {
        let friendVC = FriendViewController(friends: self.friends)
        
        self.addChildViewController(friendVC)
        self.view.addSubview(friendVC.view)
        friendVC.didMove(toParentViewController: self)
        
        let height = view.frame.height
        let width = view.frame.width
        friendVC.view.frame = CGRect(x: 0, y: self.view.frame.maxY, width: width, height: height)
    }
}

