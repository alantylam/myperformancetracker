//
//  UITextField.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-24.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

extension UITextField {
    public func setField(_ title: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderWidth = 0
        self.backgroundColor = .white
        //self.addPadding()
        self.placeholder = "Please enter your number here"
    }
    
    public func addPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextFieldViewMode.always
    }
    
    public func useUnderline(_ width: CGFloat) {
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor.black.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
