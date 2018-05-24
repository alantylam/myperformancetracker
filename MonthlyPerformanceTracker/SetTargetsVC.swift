//
//  SetTargetVC.swift
//  MonthlyPerformanceTracker
//
//  Created by Tsz Yeung Lam on 2018-04-23.
//  Copyright © 2018 Tsz Yeung Lam. All rights reserved.
//
//  Description: This class contains UI that allow user to set their personal target for each category

import UIKit

class SetTargetsVC: UIViewController {
    
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
        button.addTarget(self, action: #selector(setTargetsBtnPressed), for: .touchUpInside)
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
    
    let targetTypeLabel: UILabel = {
        let targetTypeLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        targetTypeLabel.translatesAutoresizingMaskIntoConstraints = false
        targetTypeLabel.setLabel("Target Type:")
        return targetTypeLabel
    } ()
    
    let targetTypeSelector: UIButton = {
        let targetTypeSelectorBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
        targetTypeSelectorBtn.translatesAutoresizingMaskIntoConstraints = false
        targetTypeSelectorBtn.setTitle("Set Target", for: .normal)
        targetTypeSelectorBtn.setTitleColor(UIColor(red: 0, green: 122.0/255.0, blue: 1.0, alpha: 1.0), for: .normal)
        targetTypeSelectorBtn.backgroundColor = UIColor.clear
        return targetTypeSelectorBtn
    } ()
    
    var typePicker: TypePicker!
    // ----------------------------- Program Start -----------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        makeLabelsAndFields()
        
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        
        navigationItem.title = "Set Targets"
        addCancelButton()
        self.setDefaultBackground()
        targetTypeSelector.addTarget(self, action: #selector(showPicker), for: .touchUpInside)
        
        view.addSubview(scrollView)
        
        // need to add label "Store Targets"
        
        // need to add label and text field for hours
        
        scrollView.addSubview(submitButton)
        setScrollViewConstraints()
        setInputsConstraints()
        setButtonConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
    }
    
    private func makeLabelsAndFields() {
        for category in categories {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 30))
            label.setLabel(category)
            categoryLabels.append(label)
            
            let field = UITextField(frame: CGRect(x: 0, y: 0, width: 80, height: 30))
            field.setField(category)
            categoryFields.append(field)
            
            scrollView.addSubview(label)
            scrollView.addSubview(field)
        }
    }
    
    private func addCancelButton() {
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(dismiss))
        navigationItem.rightBarButtonItem = cancelButton
    }
    
    @objc func dismiss(sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func showPicker() {
        // Do nothing for now(show picker)
    }
    
    private func setScrollViewConstraints() {
        scrollView.setConstraint(UIView.anchor.top, view)
        scrollView.setConstraint(UIView.anchor.left, view)
        scrollView.setConstraint(UIView.anchor.right, view)
        scrollView.setConstraint(UIView.anchor.bottom, view)
    }

    private func setInputsConstraints() {
        var fieldIndex = 0
        let spacing = 70

        // TODO: need to fix constraints for label and text field. Also, fix underline for text field as well
        let width = view.frame.width - 50
        offsetCurrent += 40
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
    
    @objc private func setTargetsBtnPressed() {
        self.dismiss(animated: true, completion: nil)
        // send data to database
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
