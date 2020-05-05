//
//  FriendViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-04.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class FriendViewController: UIViewController {
    
    let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.cardBackgroundColor
        view.layer.cornerRadius = 28
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
        self.view.layer.cornerRadius = 28
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        view.addGestureRecognizer(gesture)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            let frame = self?.view.frame
            print(UIScreen.main.bounds.width)
            let yComponent = UIScreen.main.bounds.height - 269
            self?.view.frame = CGRect(x: 0, y: yComponent, width: frame!.width, height: frame!.height)
        }
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
                    }
                }
            }
        }
    }
    
}
