//
//  ViewController.swift
//  tipCalc
//
//  Created by Marcus on 12/5/15.
//  Copyright © 2015 Marcus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipField: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var percentSwitch: UISegmentedControl!
    @IBOutlet weak var colorBar: UIView!
    
    var switchPos = false
    var percent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let nightMode = NSUserDefaults.standardUserDefaults().boolForKey("nightMode")
        let switchFault = NSUserDefaults.standardUserDefaults()
        
        percent = NSUserDefaults.standardUserDefaults().doubleForKey("finalTip")
        percent = percent/100
        
        if (nightMode == true) {
            self.view.backgroundColor = UIColor.redColor()
            self.percentSwitch.backgroundColor = UIColor.redColor()
            self.colorBar.backgroundColor = UIColor.greenColor()
            switchPos = true
            switchFault.setBool(switchPos, forKey: "SwitchPos")
            switchFault.synchronize()
        }
        else if(nightMode == false){
            self.view.backgroundColor = UIColor.whiteColor()
            self.percentSwitch.backgroundColor = UIColor.whiteColor()
            self.colorBar.backgroundColor = UIColor.redColor()
            switchPos = false
            switchFault.setBool(switchPos, forKey: "SwitchPos")
            switchFault.synchronize()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func defEdit(sender: AnyObject) {
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = percent * billAmount
        let total = tip + billAmount
        
        tipField.text = "\(tip)"
        totalAmount.text = "\(total)"
        
        tipField.text = String(format: "$%.2f",tip)
        totalAmount.text = String(format: "$%.2f",total)
    }
    
    @IBAction func onEditingChanged(sender: AnyObject){
        
        let tipPercentages = [0.10,0.15,0.18,0.20,0.22]
        percent = tipPercentages[percentSwitch.selectedSegmentIndex]
        
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = percent * billAmount
        let total = tip + billAmount
        
        
        tipField.text = "\(tip)"
        totalAmount.text = "\(total)"
        
        tipField.text = String(format: "$%.2f",tip)
        totalAmount.text = String(format: "$%.2f",total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
   

}

