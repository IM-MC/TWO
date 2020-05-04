//
//  ConsumptionView.swift
//  TWO
//
//  Created by Matthew Chung on 2020-04-30.
//  Copyright © 2020 Matthew Chung. All rights reserved.
//

import UIKit

class ConsumptionView: UIView {
    
    let kTotalTime: Double = 57600.00
    let kProgressionStageValue: Double = 9600.00
    
    private var foodProgression: [UIImage] = []
    private var startTime: Date?
    
    let foodImageView: UIImageView = UIImageView()
    
    let elapsedLabel: UILabel = {
        let label = UILabel()
        label.text = "elapsed"
        label.font = Font.infoBig
        label.textColor = .white
        return label
    }()
    let elapsedPercent: UILabel = {
        let label = UILabel()
        label.font = Font.infoBigLight
        label.textColor = .white
        return label
    }()
    let elapsedTime: UILabel = {
        let label = UILabel()
        label.font = Font.infoBig
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    let remainingLabel: UILabel = {
        let label = UILabel()
        label.text = "remaining"
        label.font = Font.infoSmall
        label.textColor = .white
        return label
    }()
    let remainingPercent: UILabel = {
        let label = UILabel()
        label.font = Font.infoSmallLight
        label.textColor = .white
        return label
    }()
    let remainingTime: UILabel = {
        let label = UILabel()
        label.font = Font.infoSmall
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    var elapsed: Int = 0
    var remaining: Int = 57600
    var timer: Timer = Timer()
    

    required init(foodProgression: [UIImage], startTime: Date) {
        super.init(frame: .zero)
        self.foodProgression = foodProgression
        self.startTime = startTime
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
    
    private func configureView() {
        setupView()
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(onTimerFires), userInfo: nil, repeats: true)
        
        let elapsed = Int(Date().timeIntervalSince(self.startTime!))
        self.elapsed = elapsed
        self.remaining = self.remaining - elapsed > 0 ? self.remaining - elapsed : 0
        print(elapsed)
        let image = foodProgression[0]
        self.foodImageView.image = image
    }
    
    @objc func onTimerFires(timer: Timer) {
        self.elapsed += 1
        
        if self.remaining > 0 {
            self.remaining -= 1
        }
        
        let ePercent = (Double(self.elapsed)/kTotalTime) * 100
        let rPercent = (Double(self.remaining)/kTotalTime) * 100
        
        elapsedPercent.text = "(\(Double(round(ePercent*10)/10))%)"
        remainingPercent.text = "(\(Double(round(rPercent*10)/10))%)"
        elapsedTime.text = getTimeText(seconds: self.elapsed)
        remainingTime.text = getTimeText(seconds: self.remaining)
        
        
        var progressionNumber = Double(self.elapsed)/kProgressionStageValue
        progressionNumber.round(.down)
        
        if progressionNumber > 5 {
            progressionNumber = 5
        }

        self.foodImageView.contentMode = .bottom
        self.foodImageView.image = foodProgression[Int(progressionNumber)]
    }
    
    private func secondsToTime(seconds: Int) -> (Int, Int, Int) {
        return (seconds/3600, (seconds%3600)/60, (seconds%60))
    }
    
    private func getTimeText(seconds: Int) -> String {
        let (h, m, s) = secondsToTime(seconds: seconds)
        let hString = String(h)
        var mString = String(m)
        var sString = String(s)
        
        if m < 10 {
            mString = "0\(m)"
        }
        
        if s < 10 {
            sString = "0\(s)"
        }
        return ("\(hString):\(mString):\(sString)")
    }
    
    public func invalidateTimer() {
        timer.invalidate()
    }
}

