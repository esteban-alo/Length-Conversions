//
//  ViewController.swift
//  Length-Conversions
//
//  Created by Esteban Rodríguez Alonso on 19/07/17.
//  Copyright © 2017 Esteban Rodríguez Alonso. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets
    @IBOutlet var txtDistance: UITextField!
    @IBOutlet var lblConvertionResult: UILabel!
    @IBOutlet var segmentedInit: UISegmentedControl!
    @IBOutlet var segmentedOut: UISegmentedControl!
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var btnCalculate: UIButton!
    
    // Variables
    var distanceValue : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        txtDistance.delegate = self
        
        self.view.backgroundColor = UIColor(hue: 230/360, saturation: 65/100, brightness: 70/100, alpha: 1.0)
        viewContainer.backgroundColor = UIColor(hue: 217/360, saturation: 73/100, brightness: 100/100, alpha: 1.0)
        
        btnCalculate.backgroundColor = UIColor(hue: 340/360, saturation: 87/100, brightness: 91/100, alpha: 1.0)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func calculateDistance(_ sender: UIButton) {
        if txtDistance.text == "" {
            txtDistance.text = "0.0"
        } else {
            distanceValue = Double(self.txtDistance.text!)!
        }
        calculteLengthConvertion(distancevalue: distanceValue)
    }
    
    func calculteLengthConvertion(distancevalue : Double) {
        var resultDistanceValue : Double = 0.0
        
        let segmentedInitIndex = segmentedInit.selectedSegmentIndex
        let segmentedOutIndex = segmentedOut.selectedSegmentIndex
        
        if segmentedInitIndex == segmentedOutIndex {
            resultDistanceValue = distanceValue
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 0 && segmentedOutIndex == 1 {
            resultDistanceValue = distanceValue * 1.60934
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 0 && segmentedOutIndex == 2 {
            resultDistanceValue = distanceValue * 1760
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 1 && segmentedOutIndex == 0 {
            resultDistanceValue = distanceValue / 1.60934
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 1 && segmentedOutIndex == 2 {
            resultDistanceValue = distanceValue * 1093.61
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 2 && segmentedOutIndex == 0 {
            resultDistanceValue = distanceValue / 1760
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        } else if segmentedInitIndex == 2 && segmentedOutIndex == 1 {
            resultDistanceValue = distanceValue / 1093.61
            setConvertionResult(distanceValue: distanceValue, resultDistanceValue: resultDistanceValue)
        }
    }
    
    func getUnitLegth (segmentedControl : UISegmentedControl) -> String {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            return "[mi]"
        case 1:
            return "[km]"
        case 2:
            return "[yd]"
        default:
            return ""
        }
    }
    
    func roundValue(numValue : Double) -> String {
        return String(format:"%.2f", numValue)
    }
    
    func setConvertionResult(distanceValue : Double, resultDistanceValue : Double) {
        let segmentedInitUnit = getUnitLegth(segmentedControl: segmentedInit)
        let segmentedOutUnit = getUnitLegth(segmentedControl: segmentedOut)
        
        let initDistanceValue = roundValue(numValue: distanceValue)
        let outDistanceValue = roundValue(numValue: resultDistanceValue)
        
        let resultMessageInit = String(initDistanceValue + " " + segmentedInitUnit)
        let resultMessageOut = String (outDistanceValue + " " + segmentedOutUnit)
        
        
        lblConvertionResult.text = String(resultMessageInit! + " = " + resultMessageOut!)
        lblConvertionResult.isHidden = false
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

