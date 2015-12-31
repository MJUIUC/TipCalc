//
//  SettingsViewController.swift
//  tipCalc
//
//  Created by Marcus on 12/5/15.
//  Copyright © 2015 Marcus. All rights reserved.
//

import UIKit


class SettingsViewController: UIViewController {
    
    var nightMode = false
    let switchPos = NSUserDefaults.standardUserDefaults().boolForKey("SwitchPos")
    let tipPercentageFault = NSUserDefaults.standardUserDefaults()

    
    @IBOutlet weak var colorSwitch: UISwitch!
    @IBOutlet weak var defPerField: UITextField!
    @IBOutlet weak var defTip: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool){
        super.viewDidAppear(animated)
        
        if(switchPos == true){
            colorSwitch.setOn(true, animated: false)
        }
        else if(switchPos == false){
            colorSwitch.setOn(false, animated: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func colorFunc(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if (colorSwitch.on == true){
            nightMode = true
            print("settingsStat: \(nightMode)")
            defaults.setBool(nightMode, forKey: "nightMode")
            defaults.synchronize()
        }
        else if(colorSwitch.on == false){
            nightMode = false
            print("settingsStat: \(nightMode)")
            defaults.setBool(nightMode, forKey: "nightMode")
            defaults.synchronize()
        }
    }
    
    @IBAction func changeDefTip(sender: AnyObject) {
        let defTipFinal = NSString(string: defPerField.text!).intValue
        
        
        
        defTip.text = "\(defTipFinal)"
        let number2 = Double(defTipFinal)
        tipPercentageFault.setDouble(number2, forKey: "finalTip")
        tipPercentageFault.synchronize()
    }
    
    @IBAction func finishEdit(sender: AnyObject) {
        view.endEditing(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
