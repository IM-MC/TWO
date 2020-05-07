//
//  FriendViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-04.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class FriendViewController: UIViewController, UIGestureRecognizerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    var handle: AuthStateDidChangeListenerHandle?
    var user: User?
    var friends = [String]()
    
    let kCellId = "friend_cell"
    let db = Firestore.firestore()
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.cardBackgroundColor
        view.layer.cornerRadius = 28
        return view
    }()
    
    let cardDivet: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.divet
        view.layer.cornerRadius = 2
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.infoBig
        label.text = "friends"
        label.textColor = .white
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.divider
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = Colors.cardBackgroundColor
        view.rowHeight = 96
        view.allowsSelection = false
        return view
    }()
    
    let addFriendButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "AddFriend"), for: .normal)
        button.addTarget(self, action: #selector(handleAddFriend), for: .touchUpInside)
        return button
    }()
    
    init(friends: [String]) {
        self.friends = friends
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendTableViewCell.self, forCellReuseIdentifier: kCellId)
        
        if self.friends.count == 0 {
            setupBGView()
        }
        
        self.view.backgroundColor = .clear
        self.view.layer.cornerRadius = 28
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        gesture.delegate = self
        view.addGestureRecognizer(gesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        handle = Auth.auth().addStateDidChangeListener({ (auth, user) in
            self.setUser(user)
            self.setupView()
        })
    }
    
    // get user from Auth
    func setUser(_ user: User?) {
        self.user = user
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            let frame = self?.view.frame
            let yComponent = UIScreen.main.bounds.height - 269
            self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        }
    }
    
    // Setup placeholder if tableview is empty
    func setupBGView() {
        let bgView = UIView()
        let imageView = UIImageView(image: #imageLiteral(resourceName: "NoFriendsPlaceholder"))
        
        bgView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 249).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 256).isActive = true
        imageView.centerXAnchor.constraint(equalTo: bgView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: bgView.topAnchor, constant: 50).isActive = true
        tableView.backgroundView = bgView
    }
    
    @objc func handleAddFriend(sender: UIButton) {
        let addFriendVC = AddFriendViewController(uid: self.user!.uid)
        
        self.addChildViewController(addFriendVC)
        self.view.addSubview(addFriendVC.view)
        addFriendVC.didMove(toParentViewController: self)
        
        addFriendVC.view.alpha = 0

    }
    
    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        
        // used to determine ending position
        let yCoordinate = (self.view.superview?.convert(self.view.frame, to: nil))!.minY
        let yVelocity = Int(velocity.y)
        
        self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
        recognizer.setTranslation(.zero, in: self.view)
                
        if recognizer.state == .ended {
            let yDefaultPos = UIScreen.main.bounds.height - 269
            
            if abs(yVelocity) < 500 {
                if Int(yCoordinate) > 300 {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame = CGRect(x: 0, y: yDefaultPos, width: self.view.frame.width, height: self.view.frame.height)
                    }
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height)
                        self.tableView.isScrollEnabled = true
                    }
                }
            } else {
                if yVelocity > 0 {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame = CGRect(x: 0, y: yDefaultPos, width: self.view.frame.width, height: self.view.frame.height)
                    }
                } else {
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame = CGRect(x: 0, y: 100, width: self.view.frame.width, height: self.view.frame.height)
                        self.tableView.isScrollEnabled = true
                    }
                }
            }
        }
    }
    
    
    // MARK: UIGestureRecognizerDelegate
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
        let direction = gesture.velocity(in: view).y

        let y = view.frame.minY
        if (y == 100 && tableView.contentOffset.y == 0 && direction > 0) || (y > 100) {
            tableView.isScrollEnabled = false
        } else {
            tableView.isScrollEnabled = true
        }
        
        return false
    }
    
    
    // MARK: UITableView Delegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: kCellId) as! FriendTableViewCell
        let friendUID = friends[indexPath.row]
        cell.setCell(withUid: friendUID)
        
        return cell
    }
    
}
