//
//  AddFriendViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-06.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    var uid: String = ""
    
    let bgButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(tapToDismiss), for: .touchUpInside)
        return button
    }()
    
    lazy var prompt: AddFriendPrompt = {
        let prompt = AddFriendPrompt(uid: self.uid)
        return prompt
    }()
    
    init(uid: String) {
        super.init(nibName: nil, bundle: nil)
        self.hideKeyboardWhenTapped()
        self.uid = uid
        
        self.view.frame = CGRect(x: 0, y: -100, width: self.view.frame.width, height: self.view.frame.height)
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.3) { [weak self] in
            self?.view.alpha = 1
        }
    }
    
    @objc func tapToDismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.view.alpha = 0
        }) { (_) in
            self.dismiss(animated: false, completion: nil)
        }
    }

}
