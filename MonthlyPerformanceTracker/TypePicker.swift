//
//  TypePicker.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-05-12.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class TypePicker: UIPickerView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var types: [String]!
}

extension TypePicker: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return (types?.count)!
    }
}

extension TypePicker: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return types?[row]
    }
}
