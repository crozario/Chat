//
//  Settings.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit
import Firebase

struct Constants {
    
    struct User {
        var isLoggedIn: Bool {
            get {
                return Auth.auth().currentUser?.uid != nil
            }
        }
        
        var email: String? {
            get {
                return Auth.auth().currentUser?.email!
            }
        }
    }
    
    struct Colors {
        // MARK: AuthenticationViewController Colors
        static let authenticationViewBackgroundColor = UIColorFromHex(hexValue: 0x005792)
        static let authenticationSignUpButtonBackgroundColor = UIColorFromHex(hexValue: 0x00204a)
        static let authenticationLogInButtonBackgroundColor = UIColorFromHex(hexValue: 0x00204a)
        
        // MARK: LogInViewController Colors
        static let logInViewBackgroundColor = UIColorFromHex(hexValue: 0x005792)
        static let logInButtonBackgroundColor = UIColorFromHex(hexValue: 0x00204a)
        static let logInSeparatorViewColor = UIColorFromHex(hexValue: 0x00204a)
        
        
        // MARK: SignUpViewController Colors
        static let signUpViewBackgroundColor = UIColorFromHex(hexValue: 0x005792)
        static let signUpButtonBackgroundColor = UIColorFromHex(hexValue: 0x00204a)
        static let signUpSeparatorViewColor = UIColorFromHex(hexValue: 0x00204a)
    }
    
    struct Images {
        
    }
    
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
