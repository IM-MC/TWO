//
//  SignUpViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-26.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    let db = Firestore.firestore()
    let titleImage: UIImageView = {
        let image = #imageLiteral(resourceName: "SignUpTitle") // utilize image literal
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    let firstNameField: InputFieldView = InputFieldView(title: "first name", isSecure: false)
    let lastNameField: InputFieldView = InputFieldView(title: "last name", isSecure: false)
    let emailField: InputFieldView = InputFieldView(title: "email", isSecure: false, autoCapType: .none)
    let passwordField: InputFieldView = InputFieldView(title: "password", isSecure: true)

    let optionTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = Font.title
        label.text = "Pick your poison"
        return label
    }()
    
    let signUpButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(Colors.appBackgroundColor, for: .normal)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = Colors.Button.disabled
        button.layer.cornerRadius = 20
        button.isEnabled = false
        button.addTarget(self, action: #selector(onSignUp), for: .touchUpInside)
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Cancel", for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(onCancel), for: .touchUpInside)
        return button
    }()
    
    let errorPropButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = false
        button.layer.cornerRadius = 8
        button.backgroundColor = Colors.error
        button.titleLabel?.font = Font.infoMedReg
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 11, 0, 11)
        return button
    }()
    
    // Food Options
    let popsicleSelection: FoodSelection = FoodSelection(image: #imageLiteral(resourceName: "PopsicleFull"))
    
    var selectedFood: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTapped()
        self.view.backgroundColor = UIColor.init(red: 26/255, green: 26/255, blue: 26/255, alpha: 1)
        
        popsicleSelection.addTarget(self, action: #selector(onFoodSelectionPress), for: .touchUpInside)
        setupView()
        
        popsicleSelection.tag = 0
    }
    
    @objc func onFoodSelectionPress(sender: UIButton) {
        switch (sender.tag) {
        case 0:
            // Popsicle
            popsicleSelection.layer.borderColor = Colors.Button.selected.cgColor
            selectedFood = 0
            break;
        default:
            break;
        }
        
        signUpButton.backgroundColor = Colors.Button.orangeBackground
        signUpButton.isEnabled = true
    }
    
    @objc func onSignUp(sender: UIButton) {
        guard let firstName = firstNameField.textField.text, !firstName.isEmpty else {
            errorPropButton.setTitle("First name can't be empty!", for: .normal)
            errorPropButton.alpha = 1
            return
        }
        
        guard let email = emailField.textField.text, !email.isEmpty else {
            errorPropButton.setTitle("Email can't be empty!", for: .normal)
            errorPropButton.alpha = 1
            return
        }
        
        guard let password = passwordField.textField.text, !password.isEmpty else {
            errorPropButton.setTitle("Password can't be empty", for: .normal)
            errorPropButton.alpha = 1
            return
        }
        
        let spinner = SpinnerViewController()
        
        self.addChildViewController(spinner)
        spinner.view.frame = self.view.frame
        self.view.addSubview(spinner.view)
        spinner.didMove(toParentViewController: self)
        
        Auth.auth().createUser(withEmail: email, password: password) { (res, err) in
            spinner.willMove(toParentViewController: nil)
            spinner.view.removeFromSuperview()
            spinner.removeFromParentViewController()
            
            if err != nil {
                print(err ?? "Error creating user")
            } else if let result = res {
                self.storeInDatabase(uid: result.user.uid)
                self.pushFastView()
                self.updateUserDefaults()
                self.errorPropButton.alpha = 0
            } else {
                print("Error creating user on Auth")
            }
        }
    }
    
    @objc func onCancel(sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateUserDefaults() {
        let email = emailField.textField.text!
        let password = passwordField.textField.text!
        
        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
        UserDefaults.standard.set(email, forKey: kUserEmail)
        UserDefaults.standard.set(password, forKey: kUserPassword)
        UserDefaults.standard.synchronize()
    }
    
    private func pushFastView() {
        self.navigationController?.pushViewController(FastViewController(), animated: true)
    }
    
    // Store user info in DB
    private func storeInDatabase(uid: String) {
        // temp for images
        let width = Int.random(in: 30..<200)
        let height = Int.random(in: 30..<200)
        
        let firstName = firstNameField.textField.text!
        let lastName = lastNameField.textField.text ?? ""
        let email = emailField.textField.text!
        let password = passwordField.textField.text!
        
        let data: [String: Any] = [
            kdbFirstName: firstName,
            kdbLastName: lastName,
            "email": email, // keep track in db, not needed in app
            "password": password, // keep track in db, not needed in app
            kdbIsFasting: false,
            kdbFoodSelection: selectedFood,
            kdbStartTime: Timestamp(date: Date()), // always replaced
            kdbFastsCompleted: 0,
            kdbLongestFast: 0,
            kdbFriends: [],
            kdbProfileImg: "https://source.unsplash.com/random/\(width)x\(height)", //random image for now since have no backend storage
        ]
        
        db.collection("users").document(uid).setData(data) { err in
            if let err = err{
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written")
            }
        }
    }
}
