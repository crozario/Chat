//
//  Settings.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit

class Settings {
    static let loginViewBackgroundColor = UIColorFromHex(hexValue: 0x448ef6)
    static let loginMainColor = UIColorFromHex(hexValue: 0x75c2f6)
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

func UIColorFromHex(hexValue: UInt, alpha: Double = 1.0) -> UIColor {
    return UIColor(
        red: CGFloat((hexValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((hexValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(hexValue & 0x0000FF) / 255.0,
        alpha: CGFloat(alpha)
    )
}
