//
//  UIView.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-24.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

extension UIView {
    public enum anchor {
        case top
        case bottom
        case left
        case right
        case height
    }
    
    public func setConstraint(_ position: anchor, _ mainFrame: UIView) {
        self.setConstraint(position, mainFrame, 0)
    }
    
    public func setConstraint(_ position: anchor, _ mainFrame: UIView, _ offSet: CGFloat) {
        if position == anchor.top {
            self.topAnchor.constraint(equalTo: mainFrame.topAnchor, constant: offSet).isActive = true
        }
        
        if position == anchor.bottom {
            self.bottomAnchor.constraint(equalTo: mainFrame.bottomAnchor, constant: offSet).isActive = true
        }
        
        if position == anchor.left {
            self.leftAnchor.constraint(equalTo: mainFrame.leftAnchor, constant: offSet).isActive = true
        }
        
        if position == anchor.right {
            self.rightAnchor.constraint(equalTo: mainFrame.rightAnchor, constant: offSet).isActive = true
        }
        
        if position == anchor.height {
            self.heightAnchor.constraint(equalTo: mainFrame.heightAnchor, constant: offSet).isActive = true
        }
    }
    
//    public func setConstraint(_ position: anchor, _ anchorPt: NSLayoutXAxisAnchor, _ offSet: CGFloat) {
//        if position == anchor.left {
//            self.leftAnchor.constraint(equalTo: anchorPt, constant: offSet).isActive = true
//        }
//        
//        if position == anchor.right {
//            self.rightAnchor.constraint(equalTo: anchorPt, constant: offSet).isActive = true
//        }
//    }
}
