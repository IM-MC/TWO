//
//  FastingView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-28.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class FastingView: UIView {
    
    private var uid: String = ""
    private var foodChoice: Int = -1
    private var isFasting: Bool = false // carry one source of truth for fast state
    private var startTime: Date = Date()
    let db = Firestore.firestore()
    
    let currentlyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "currently:"
        label.font = UIFont(name: "Lato-Bold", size: 21)
        return label
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "Loading"
        label.font = UIFont(name: "Lato-Bold", size: 38)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.init(red: 223/255, green: 60/255, blue: 101/255, alpha: 1)
        label.textAlignment = .center
        label.text = "..."
        label.font = UIFont(name: "Lato-Light", size: 21)
        return label
    }()
    
    let motivationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "-"
        label.font = UIFont(name: "Lato-Bold", size: 21)
        return label
    }()
    
    let placeholderView: UIView = UIView()
    
    let startStopButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Colors.appBackgroundColor
        button.addTarget(self, action: #selector(toggleFastState), for: .touchUpInside)
        button.titleLabel?.font = Font.Button.mega
        button.layer.shadowOffset = CGSize(width: 0.0, height: 0.5)
        button.layer.cornerRadius = 26
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 3
        return button
    }()
    
    required init(uid: String) {
        super.init(frame: .zero)
        self.uid = uid
        self.configureView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    func configureView() {
        self.setupView()
        
        let docRef = db.collection("users").document(self.uid)
        
        // todo: IF USERDEFAULTS THEN USE THAT
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                self.foodChoice = document.get(kdbFoodSelection) as? Int ?? 0 //default to popsicle if data is corrupt/not found (should never happen)
                
                self.isFasting = document.get(kdbIsFasting) as? Bool ?? false
                self.startTime = (document.get(kdbStartTime) as! Timestamp).dateValue()
                self.setStatus(self.isFasting)
                self.updateUI()
                
                self.reassignPlaceholder()
                
            } else {
                print("Doc doesn't exist")
            }
        }
    }
    
    private func setStatus(_ isFasting: Bool) {
        if isFasting {
            statusLabel.text = "FASTING"
        } else {
            statusLabel.text = "RESTING"
        }
    }
    
    private func updateUI() {
        let food_data = kFoodValues[self.foodChoice]
        self.titleLabel.text = food_data?.title
        self.motivationLabel.text = food_data?.slogan
        
        if self.isFasting {
            startStopButton.setTitle("End Fast", for: .normal)
            startStopButton.layer.shadowColor = Colors.shadowGrey.cgColor
            startStopButton.setTitleColor(.white, for: .normal)
            statusLabel.text = "FASTING"
        } else {
            startStopButton.setTitle("Start", for: .normal)
            startStopButton.layer.shadowColor = Colors.shadowGreen.cgColor
            startStopButton.setTitleColor(Colors.startGreen, for: .normal)
            statusLabel.text = "RESTING"
        }
    }
    
    private func reassignPlaceholder() {
        if self.placeholderView.subviews.count > 0 {
            if self.placeholderView.subviews[0] is ConsumptionView {
                let view = self.placeholderView.subviews[0] as! ConsumptionView
                view.invalidateTimer()
            }
            self.placeholderView.subviews[0].removeFromSuperview()
        }
        
        if self.isFasting {
            let consumptionView = ConsumptionView(foodProgression: kFoodValues[self.foodChoice]!.imageProgression, startTime: self.startTime)
            
            self.placeholderView.addSubview(consumptionView)
        } else {
            let image = #imageLiteral(resourceName: "PopsicleFlat")
            let foodImageView = UIImageView(image: image)
            
            self.placeholderView.addSubview(foodImageView)
            foodImageView.translatesAutoresizingMaskIntoConstraints = false
            foodImageView.centerXAnchor.constraint(equalTo: self.placeholderView.centerXAnchor, constant: 15).isActive = true
            foodImageView.centerYAnchor.constraint(equalTo: self.placeholderView.centerYAnchor, constant: 10).isActive = true
        }
    }
    
    @objc func toggleFastState(sender: UIButton) {
        let userRef = db.collection("users").document(self.uid)
        
        
        // if we can't update the DB values, don't update our UI
        if self.isFasting {
            userRef.updateData([
                kdbIsFasting: false
            ]) { (err) in
                if let err = err {
                    print("Error updating document after fast: \(err)")
                } else { // Success
                    self.isFasting = false
                    self.fullViewUpdate()
                }
            }
        } else {
            userRef.updateData([
                kdbStartTime: Timestamp(date: Date()),
                kdbIsFasting: true
            ]) { (err) in
                if let err = err {
                    print("Error updating document after starting fast: \(err)")
                } else { // Success
                    self.isFasting = true
                    self.startTime = Date()
                    self.fullViewUpdate()
                }
            }
        }
    }
    
    func fullViewUpdate() {
        self.reassignPlaceholder()
        self.updateUI()
    }
}
