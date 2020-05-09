//
//  FriendTableViewCell.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-05.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class FriendTableViewCell: UITableViewCell {
    
    let db = Firestore.firestore()
    
    let imgView: UIImageView = {
        let view = UIImageView()
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 39
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = Font.infoBig
        label.textColor = .white
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Font.infoSmallLight
        label.textColor = Colors.Text.subtle
        return label
    }()
    
    let fastCountLabel: UILabel = {
        let label = UILabel()
        label.font = Font.infoSmallLight
        label.textColor = Colors.Text.highlighted
        return label
    }()
    
    let timerImage: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Timer"))
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        
        self.backgroundColor = Colors.cardBackgroundColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setCell(withUid uid: String) {
        let docRef = db.collection("users").document(uid)
        
        docRef.getDocument { (doc, err) in
            if let doc = doc, doc.exists {
                let firstName = doc.get(kdbFirstName) as! String
                let lastName = doc.get(kdbLastName) as! String
                let isFasting = doc.get(kdbIsFasting) as! Bool
                let fastsCompleted = doc.get(kdbFastsCompleted) as! Int
                let imgUrl = doc.get(kdbProfileImg) as! String
                
                let url = URL(string: imgUrl)
                if let data = try? Data(contentsOf: url!) {
                    self.imgView.image = UIImage(data: data)
                } else {
                    self.imgView.image = #imageLiteral(resourceName: "AppLogo")
                }
                
                var status = ""
                if isFasting {
                    status = "fasting"
                    self.timerImage.alpha = 1
                } else {
                    status = "resting"
                    self.timerImage.alpha = 0
                }
                
                self.nameLabel.text = "\(firstName) \(lastName)"
                self.subtitleLabel.text = "currently: \(status)"
                self.fastCountLabel.text = "\(fastsCompleted) completed fasts"
            } else {
                self.nameLabel.text = "Error retrieving data"
                print("Error retrieving document for uid: \(uid)")
            }
        }
    }
}
