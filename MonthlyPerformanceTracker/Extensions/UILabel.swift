//
//  UILabel.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-24.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

extension UILabel {
    
    public func setLabel(_ title: String) {
        self.setLabel(title, 17)
    }
    
    public func setLabel(_ title: String, _ fontSize: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.text = title
        self.textColor = .black
        self.textAlignment = NSTextAlignment.center
        self.font = UIFont(name: self.font.fontName, size: fontSize)
        self.font = UIFont.boldSystemFont(ofSize: fontSize)
    }
}
