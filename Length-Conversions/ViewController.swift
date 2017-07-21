//
//  ViewController.swift
//  Length-Conversions
//
//  Created by Esteban Rodríguez Alonso on 19/07/17.
//  Copyright © 2017 Esteban Rodríguez Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Convertion Units
    let mileUnit : Double = 1609.34
    let yardUnit : Double = 1760
    
    // Outlets
    @IBOutlet var txtDistance: UITextField!
    @IBOutlet var lblConvertionResult: UILabel!
    @IBOutlet var segmentedInit: UISegmentedControl!
    @IBOutlet var segmentedOut: UISegmentedControl!
    
    
    var distanceValue : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtDistance.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateDistance(_ sender: UIButton) {
        let segmentedInitUnit = getUnitLegth(segmentedControl: segmentedInit)
        let segmentedOutUnit = getUnitLegth(segmentedControl: segmentedOut)
        
        let segmentedInitValue = segmentedInit.selectedSegmentIndex
        let segmentedOutValue = segmentedOut.selectedSegmentIndex
        
        print(segmentedInitValue)
        print(segmentedOutValue)
        
        if txtDistance.text == "" {
            txtDistance.text = "0.0"
        } else {
            distanceValue = Double(self.txtDistance.text!)!
        }
        
        if segmentedInitValue == segmentedOutValue {
            let initDistanceValue = roundValue(numValue: distanceValue)
            let outDistanceValue = roundValue(numValue: distanceValue)
            
            let resultMessage = initDistanceValue + segmentedInitUnit + " = " + outDistanceValue + segmentedOutUnit
            lblConvertionResult.text = resultMessage
            lblConvertionResult.isHidden = false
        }
    }
    
    
    
    func calculteLengthConvertion(distanceValue : Double) {
        if segmentedInit == segmentedOut {
            print(segmentedInit)
        }
        
        print("Unidad 1 \(segmentedInit)")
    }
    
    func getUnitLegth (segmentedControl : UISegmentedControl) -> String {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return "mi"
        case 1:
            return "m"
        case 2:
            return "km"
        case 3:
            return "yd"
        default:
            return ""
        }
    }
    
    func roundValue(numValue : Double) -> String {
        return String(format:"%.2f", numValue)
    }
    
    
    func showConvertion(number : Double, convertionType : String) {
        self.lblConvertionResult.isHidden = false
    }
    
    // Hide Keyboard Functions
    
    // Hide Keyboard if return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // Hide Keyboard by touching anywhere outsie a TextField
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

