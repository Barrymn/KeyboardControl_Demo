//
//  ViewController.swift
//  KeyboardTest
//
//  Created by Barry Ma on 2016-04-07.
//  Copyright © 2016 BarryMa. All rights reserved.
//

import UIKit
import BSKeyboardControls

class ViewController: UIViewController, UITextFieldDelegate, BSKeyboardControlsDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    var keyboardControls: BSKeyboardControls?
    var pickerData = ["1", "2", "3", "4", "5", "6"]
    var picker = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let height = self.view.frame.height
        let width = self.view.frame.width
        
        picker.delegate = self
        picker.dataSource = self
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
        
        //TEXTFIELD1
        let textField1 = UITextField(frame: CGRectMake(0, 0, 0, 0))
        textField1.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textField1)
        self.view.addConstraint(NSLayoutConstraint(item: textField1, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: -height * 0.15))
        self.view.addConstraint(NSLayoutConstraint(item: textField1, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField1, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField1, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: height * 0.06))
        textField1.placeholder = "enter your phone number"
        textField1.textAlignment = .Center
        textField1.font = UIFont.systemFontOfSize(15)
        textField1.borderStyle = UITextBorderStyle.RoundedRect
        textField1.autocorrectionType = UITextAutocorrectionType.No
        textField1.keyboardType = UIKeyboardType.Default
        textField1.returnKeyType = UIReturnKeyType.Done
        textField1.clearButtonMode = UITextFieldViewMode.WhileEditing;
        textField1.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textField1.layer.cornerRadius = 18
        textField1.layer.borderWidth = 2
        textField1.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField1.delegate = self
        
        //TEXTFIELD2
        let textField2 = UITextField(frame: CGRectMake(0, 0, 0, 0))
        textField2.inputView = picker
        textField2.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textField2)
        self.view.addConstraint(NSLayoutConstraint(item: textField2, attribute: .Bottom, relatedBy: .Equal, toItem: textField1, attribute: .Top, multiplier: 1.0, constant: -height * 0.03))
        self.view.addConstraint(NSLayoutConstraint(item: textField2, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField2, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField2, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: height * 0.06))
        textField2.placeholder = "enter a number from 1 to 6"
        textField2.textAlignment = .Center
        textField2.font = UIFont.systemFontOfSize(15)
        textField2.borderStyle = UITextBorderStyle.RoundedRect
        textField2.autocorrectionType = UITextAutocorrectionType.No
        textField2.keyboardType = UIKeyboardType.Default
        textField2.returnKeyType = UIReturnKeyType.Done
        textField2.clearButtonMode = UITextFieldViewMode.WhileEditing;
        textField2.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textField2.layer.cornerRadius = 18
        textField2.layer.borderWidth = 2
        textField2.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField2.delegate = self
        
        //TEXTFIELD3
        let textField3 = UITextField(frame: CGRectMake(0, 0, 0, 0))
        textField3.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(textField3)
        self.view.addConstraint(NSLayoutConstraint(item: textField3, attribute: .Bottom, relatedBy: .Equal, toItem: textField2, attribute: .Top, multiplier: 1.0, constant: -height * 0.03))
        self.view.addConstraint(NSLayoutConstraint(item: textField3, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField3, attribute: .Right, relatedBy: .Equal, toItem: self.view, attribute: .Right, multiplier: 1.0, constant: -width * 0.20))
        self.view.addConstraint(NSLayoutConstraint(item: textField3, attribute: .Height, relatedBy: .Equal, toItem: nil , attribute: .NotAnAttribute, multiplier: 1.0, constant: height * 0.06))
        textField3.placeholder = "enter your name"
        textField3.textAlignment = .Center
        textField3.font = UIFont.systemFontOfSize(15)
        textField3.borderStyle = UITextBorderStyle.RoundedRect
        textField3.autocorrectionType = UITextAutocorrectionType.No
        textField3.keyboardType = UIKeyboardType.Default
        textField3.returnKeyType = UIReturnKeyType.Done
        textField3.clearButtonMode = UITextFieldViewMode.WhileEditing;
        textField3.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
        textField3.layer.cornerRadius = 18
        textField3.layer.borderWidth = 2
        textField3.layer.borderColor = UIColor.lightGrayColor().CGColor
        textField3.delegate = self
        
        let fields: [UITextField] = [textField3,textField2,textField1]
        keyboardControls = BSKeyboardControls(fields: fields)
        keyboardControls?.delegate = self
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.layoutIfNeeded()
        if let userInfo = sender.userInfo {
            if let keyboardHeight = userInfo[UIKeyboardFrameEndUserInfoKey]?.CGRectValue().size.height {
                UIView.animateWithDuration(0.1, animations: {
                    self.view.constraints[4].constant = -keyboardHeight
                    self.view.layoutIfNeeded()
                })
            }
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.layoutIfNeeded()
        UIView.animateWithDuration(0.1, animations: {
            self.view.constraints[4].constant = -self.view.frame.height*0.15
            self.view.layoutIfNeeded()
        })
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func keyboardControlsDonePressed(keyboardControls: BSKeyboardControls!) {
        self.view.endEditing(true)
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        self.keyboardControls?.activeField = textField
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let textField = keyboardControls?.activeField as! UITextField
        textField.text = pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }


}

