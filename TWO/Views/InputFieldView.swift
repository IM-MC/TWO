//
//  InputFieldView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-29.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class InputFieldView: UIView {
    
    private var title: String = ""
    private var isSecure: Bool = false
    private var autoCapType: UITextAutocapitalizationType = .words
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = Font.InputField.title
        return label
    }()
    
    let textField: TextField = {
        let textfield = TextField()
        textfield.isUserInteractionEnabled = true
        textfield.backgroundColor = Colors.InputField.dark
        textfield.textColor = .white
        
        return textfield
    }()
    
    required init(title: String, isSecure: Bool, autoCapType: UITextAutocapitalizationType = .words) {
        super.init(frame: .zero)
        self.title = title
        self.isSecure = isSecure
        self.autoCapType = autoCapType
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
        titleLabel.text = self.title
        textField.isSecureTextEntry = self.isSecure
        textField.autocapitalizationType = self.autoCapType
        
        self.addSubview(titleLabel)
        self.addSubview(textField)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2).isActive = true
        textField.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 353).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 38).isActive = true
    }
}


/*
 Custom TextField to allow for some padding on input
 */
class TextField: UITextField {
    let padding = UIEdgeInsets(top: 0, left: 10, bottom:0, right: 10)
    
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
