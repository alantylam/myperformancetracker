//
//  SettingsVC.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-23.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false // enable custom constraints
        self.setDefaultBackground()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }
    
    private func setupUI() {
        self.tabBarController?.navigationItem.title = "Settings"
        self.tabBarController?.navigationItem.rightBarButtonItem = nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
