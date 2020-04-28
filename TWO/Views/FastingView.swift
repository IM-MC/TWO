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
        label.text = "Popsicle Pwner"
        label.font = UIFont(name: "Lato-Light", size: 21)
        return label
    }()
    
    let motivationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.text = "cool as..."
        label.font = UIFont(name: "Lato-Bold", size: 21)
        return label
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
                
                self.setStatus(document.get("isFasting") as? Bool ?? false)
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
    
}
