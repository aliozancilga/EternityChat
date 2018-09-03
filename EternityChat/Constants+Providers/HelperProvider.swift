//
//  HelperProvider.swift
//  EternityChat
//
//  Created by Macbook on 9.02.2018.
//  Copyright © 2018 Ali Ozan. All rights reserved.
//

import UIKit


class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}


func timeConverter(_ time: NSNumber) -> String{
    let now = NSDate(timeIntervalSince1970: TimeInterval(truncating: time))
    let dayTimePeriodFormatter = DateFormatter()
    dayTimePeriodFormatter.dateFormat = "hh:mm:ss a"
    let dateString = dayTimePeriodFormatter.string(from: now as Date)
    return dateString
}
