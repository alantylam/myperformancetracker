//
//  MainViewController.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-23.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // add VC for tabs
        
        let inputTab = UINavigationController(rootViewController: InputTabVC())
        let inputTabItem = UITabBarItem(title: "Input", image: #imageLiteral(resourceName: "InputRecord"), selectedImage: #imageLiteral(resourceName: "InputRecord"))
        inputTab.tabBarItem = inputTabItem
        
        let performanceTab = UINavigationController(rootViewController: PerformanceTabVC())
        let performanceTabItem = UITabBarItem(title: "Performance", image: #imageLiteral(resourceName: "PerformanceGraph"), selectedImage: #imageLiteral(resourceName: "PerformanceGraph"))
        performanceTab.tabBarItem = performanceTabItem
        
        let settingsTab = UINavigationController(rootViewController: SettingsVC())
        let settingsTabItem = UITabBarItem(title: "Settings", image: #imageLiteral(resourceName: "Settings"), selectedImage: #imageLiteral(resourceName: "Settings"))
        settingsTab.tabBarItem = settingsTabItem
        
        self.tabBar.barTintColor = UIColor.yellow
        self.viewControllers = [inputTab, performanceTab, settingsTab]
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
