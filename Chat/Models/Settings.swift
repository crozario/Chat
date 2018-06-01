//
//  Settings.swift
//  Chat
//
//  Created by Crossley Rozario on 5/25/18.
//  Copyright © 2018 Crossley Rozario. All rights reserved.
//

import UIKit
import Firebase


class SlideAnimator: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    let duration = 0.5
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else {
            return
        }
        
        guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else {
            return
        }
        
        let container = transitionContext.containerView
        let screenOffUp = CGAffineTransform(translationX: 0, y: -container.frame.height)
        let screenOffDown = CGAffineTransform(translationX: 0, y: container.frame.height)
        
        container.addSubview(fromView)
        container.addSubview(toView)
        toView.transform = screenOffUp
        
        UIView.animate(withDuration: duration, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.8, options: [], animations: {
            fromView.transform = screenOffDown
            fromView.alpha = 0.5
            toView.transform = CGAffineTransform.identity
            toView.alpha = 1
        }) { (success) in
            transitionContext.completeTransition(success)
        }
    }
}

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
