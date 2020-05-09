//
//  FastInfoView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-05-02.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit
import Firebase

class FastInfoView: UIView {

    let db = Firestore.firestore()
    var isFasting: Bool = false
    var startTime: Date?
    var fastsCompleted: Int = 0
    var longestFast: Int = 0
    var uid: String = ""
    
    let leftLabelTitle: UILabel = {
        let label = UILabel()
        label.font = Font.infoMedLight
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let leftLabelInfo: UILabel = {
        let label = UILabel()
        label.font = Font.megaLight
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.divider
        return view
    }()
    
    let rightLabelTitle: UILabel = {
        let label = UILabel()
        label.font = Font.infoMedLight
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    let rightLabelInfo: UILabel = {
        let label = UILabel()
        label.font = Font.megaLight
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    required init(uid: String) {
        super.init(frame: .zero)
        self.uid = uid
        getDBValues()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureView()
    }
    
    func getDBValues() {
        let docRef = db.collection("users").document(self.uid)
        
        docRef.getDocument { (document, err) in
            if let document = document, document.exists {
                self.isFasting = document.get(kdbIsFasting) as? Bool ?? false
                self.startTime = (document.get(kdbStartTime) as! Timestamp).dateValue()
                self.fastsCompleted = document.get(kdbFastsCompleted) as! Int
                self.longestFast = document.get(kdbLongestFast) as! Int
                self.configureView()
            } else {
                print("Doc doesn't exist \(String(describing: err))")
            }
        }
    }
    
    func configureView() {
        setupView()
        
        if self.isFasting {
            leftLabelTitle.text = "time started"
            leftLabelInfo.text = convertToTime(date: self.startTime!)
            rightLabelTitle.text = "time ending"
            rightLabelInfo.text = convertToTime(date: self.startTime!, extend: true)
        } else {
            leftLabelTitle.text = "fasts completed"
            leftLabelInfo.text = String(self.fastsCompleted)
            rightLabelTitle.text = "longest fast"
            rightLabelInfo.text = secondsTimeString(seconds: self.longestFast)
        }
    }
    
    func convertToTime(date: Date, extend: Bool = false) -> String {
        let calendar = Calendar.current
        var hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        
        if extend {
            hour += 16
        }
        
        if hour >= 24 {
            hour = hour - 24
        }
        
        return printAMPM(hour: hour, minute: minutes)
    }
    
    
    // Time Formatting
    func printAMPM(hour: Int, minute: Int) -> String{
        var meridiem = "AM"
        var nHours = hour
        var nMinute = String(minute)
        if hour > 12 {
            nHours = hour - 12
            meridiem = "PM"
        } else if nHours == 0 {
            nHours = 12
        }
        
        if minute < 10 {
            nMinute = "0\(minute)"
        }
        
        return ("\(nHours):\(nMinute) \(meridiem)")
    }
    
    func secondsToTime(seconds: Int) -> (Int, Int) {
        return (seconds/3600, (seconds%3600)/60)
    }
    
    func secondsTimeString(seconds: Int) -> String {
        let (h,m) = secondsToTime(seconds: seconds)
        var mString = String(m)
        
        if m < 10 {
            mString = "0\(m)"
        }
        
        return ("\(h):\(mString)")
    }
    
    public func refreshValues() {
        self.getDBValues()
    }
}
