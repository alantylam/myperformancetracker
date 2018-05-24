//
//  PerformanceTabVC.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-23.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class PerformanceTabVC: UIViewController {
    
    var offsetCurrent:CGFloat = 0
    
    let categories: [String] = {
        return ["NAC", "MBB", "HUP", "PPC", "ACC", "MC", "DP"]
    } ()
    
    var categoriesLabel: [UILabel] = {
        return []
    }()
    
    let summaryLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.setLabel("Summary", 20)
        return label
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.translatesAutoresizingMaskIntoConstraints = false // enable custom constraints
        self.setDefaultBackground()
        setupUI()
        self.view.addSubview(summaryLabel)
        createLabels()
        
        addConstraints()
        // Do any additional setup after loading the view.
    }
    
    private func createLabels() {
        for target in categories {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
            label.setLabel(target)
            categoriesLabel.append(label)
            view.addSubview(label)
        }
    }
    
    private func addConstraints() {
        offsetCurrent += 50
        summaryLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offsetCurrent).isActive = true
        summaryLabel.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        summaryLabel.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        offsetCurrent += 50
        for label in categoriesLabel {
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: offsetCurrent).isActive = true
            //label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            offsetCurrent += 50
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }
    
    private func setupUI() {
        self.tabBarController?.navigationItem.title = "Performance"
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
