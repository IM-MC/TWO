//
//  AddFriendPrompt.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-06.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class AddFriendPrompt: UIView {
    
    let db = Firestore.firestore()
    var uid: String = ""
    
    let titleText: UILabel = {
        let label = UILabel()
        label.text = "Add Friend"
        label.font = Font.infoBig
        label.textColor = .white
        return label
    }()
    
    let divider: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.divider
        return view
    }()
    
    let userFriendText: UILabel = {
        let label = UILabel()
        label.font = Font.infoMedLight
        label.textColor = .white
        label.text = "Your friend code:"
        return label
    }()
    
    let friendCode: UILabel = {
        let label = UILabel()
        label.font = Font.infoMed
        label.textColor = Colors.Text.highlighted
        return label
    }()

    let friendCodeText: UILabel = {
        let label = UILabel()
        label.font = Font.infoBigLight
        label.textColor = .white
        label.text = "Friend's code:"
        return label
    }()
    
    let friendCodeField: FriendCodeTextField = {
        let field = FriendCodeTextField()
        field.layer.cornerRadius = 4
        field.backgroundColor = Colors.Input.background
        field.textAlignment = .left
        return field
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "AddFriendButton"), for: .normal)
        button.addTarget(self, action: #selector(addFriend), for: .touchUpInside)
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        self.backgroundColor = Colors.appBackgroundColor
        self.layer.cornerRadius = 30
        self.setupView()
        
        friendCode.text = self.uid
    }
    
    @objc func addFriend(sender: UIButton) {
        if let code = friendCodeField.text {
            let docRef = db.collection("users").document(code)
            
            docRef.getDocument { (doc, err) in
                if let document = doc, document.exists {
                    print("YOYO")
                    self.db.collection("users").document(self.uid).updateData(
                        [kdbFriends: FieldValue.arrayUnion([code])
                    ])
                    docRef.updateData((
                        [kdbFriends: FieldValue.arrayUnion([self.uid])]
                    ))
                } else {
                    print("Error, user doesn't exist")
                }
            }
        } else {
            return
        }
    }
    
}


/*
 Custom TextField to allow for some padding on input
 */
class FriendCodeTextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom:0, right: 30)
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect(bounds, padding)
   }

   override open func editingRect(forBounds bounds: CGRect) -> CGRect {
       return UIEdgeInsetsInsetRect(bounds, padding)
   }
}
