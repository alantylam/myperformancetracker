//
//  ViewController.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-18.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set up screens
        setupUI()
    }
    
    private func setupUI() {
        let voiceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 10))
        voiceLabel.center.x = view.center.x
        voiceLabel.center.y = view.center.y
        voiceLabel.text = "Voice"
        voiceLabel.textColor = UIColor.black
        
        view.addSubview(voiceLabel)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

