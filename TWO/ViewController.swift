//
//  ViewController.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-24.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 26/255, green: 26/255, blue: 26/255, alpha: 100)
        
        let currentlyLabel = UILabel(frame: CGRect(x: 154, y: 53, width: 95, height: 25))
        currentlyLabel.textColor = .white
        currentlyLabel.text = "currently:"
        currentlyLabel.font = UIFont(name: "Lato-Bold", size: 21)
        self.view.addSubview(currentlyLabel)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

