//
//  SettingsViewController.swift
//  tippy
//
//  Created by Administrator on 3/13/17.
//  Copyright © 2017 Administrator. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var percentPicker: UIPickerView!
    
    let percents = [15, 20, 25]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(percents[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return percents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let defaults = UserDefaults.standard
        let perValue = percents[row]
        
        print("perValue = \(perValue)")
        defaults.set(perValue, forKey: "tippyDefaultPercent")
        defaults.synchronize()
        
        percentLabel.text = "\(perValue)%"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let defaults = UserDefaults.standard
        let perValue = defaults.integer(forKey: "tippyDefaultPercent")
        print("pervalue is \(perValue)")
        
        for (ind, el) in percents.enumerated() {
            if (el == perValue) {
                percentPicker.selectRow(ind, inComponent: 0, animated: true)
                percentLabel.text = "\(perValue)%"

                print( "set \(ind) for \(el)")
            }
        }
        
        print("setting will appear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("setting did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("setting will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("setting did disappear")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
