//
//  MainScreenVC.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-18.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//

import UIKit

class InputTabVC: UIViewController, UINavigationControllerDelegate {
    
    var navBar: UINavigationItem!
    let defaultFrame = CGRect(x: 0, y: 0, width: 50, height: 30)
    var offsetCurrent = 0

    let categories: [String] = {
        return ["NAC", "MBB", "HUP", "PPC", "ACC", "MC", "DP"]
    } ()
    
    var categoryLabels : [UILabel] = {
        return []
    } ()
    
    var categoryFields: [UITextField] = {
        return []
    } ()
    
    let submitButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 60, height: 45))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Submit", for: .normal)
        button.backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1.0)
        button.layer.cornerRadius = 7
        return button
    } ()
    
    let scrollView: UIScrollView = {
        let sView = UIScrollView()
        sView.translatesAutoresizingMaskIntoConstraints = false // enable custom constraints
        sView.backgroundColor = .white
        sView.isScrollEnabled = true
        sView.bounces = true
        sView.showsVerticalScrollIndicator = true
        sView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height*4))
        return sView
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabelsAndFields()
        
        navBar = self.tabBarController?.navigationItem
        self.setDefaultBackground()
        setupUI()
        
        self.view.addSubview(scrollView)
        
        for label in categoryLabels {
            scrollView.addSubview(label)
        }
        
        for field in categoryFields {
            scrollView.addSubview(field)
        }
        
        scrollView.addSubview(submitButton)
        setScrollViewConstraints()
        setInputsConstraints()
        setButtonConstraints()
    }
    
    private func makeLabelsAndFields() {
        for category in categories {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            label.setLabel(category)
            categoryLabels.append(label)
            
            let field = UITextField(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
            field.setField(category)
            categoryFields.append(field)
        }
    }
    
    private func setScrollViewConstraints() {
        scrollView.setConstraint(UIView.anchor.top, view)
        scrollView.setConstraint(UIView.anchor.left, view)
        scrollView.setConstraint(UIView.anchor.right, view)
        scrollView.setConstraint(UIView.anchor.bottom, view, -(self.tabBarController?.tabBar.frame.height)!)
    }
    
    private func setInputsConstraints() {
        var fieldIndex = 0
        let spacing = 70
        
        // TODO: need to fix constraints for label and text field. Also, fix underline for text field as well
        let width = view.frame.width - 50
        for label in categoryLabels {
            label.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(offsetCurrent)).isActive = true
            offsetCurrent += (spacing / 2)
            let field = categoryFields[fieldIndex]
            field.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: CGFloat(offsetCurrent)).isActive = true
            field.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            field.widthAnchor.constraint(equalToConstant: width).isActive = true
            field.heightAnchor.constraint(equalToConstant: 30).isActive = true
            field.useUnderline(width)
            label.leftAnchor.constraint(equalTo: field.leftAnchor).isActive = true
            fieldIndex += 1
            offsetCurrent += spacing
        }
    }
    
    private func setButtonConstraints() {
        submitButton.setConstraint(UIView.anchor.left, view, 100)
        submitButton.setConstraint(UIView.anchor.right, view, -100)
        submitButton.setConstraint(UIView.anchor.top, scrollView, CGFloat(offsetCurrent))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupUI()
    }
    
    private func setupUI() {
        navBar.title = "Input"
        addSetTargetsBtn()
    }
    
    private func addSetTargetsBtn() {
        let setTargetBtn = UIBarButtonItem(title: "Set Targets", style: .plain, target: self, action: #selector(setTargetsBtnPressed))
        navBar.rightBarButtonItem = setTargetBtn
    }
    
    @objc private func setTargetsBtnPressed() {
        showSetTargets()
    }

    private func showSetTargets() {
        self.navigationController?.present(UINavigationController(rootViewController: SetTargetsVC()), animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
