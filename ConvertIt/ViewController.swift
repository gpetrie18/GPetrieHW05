//
//  ViewController.swift
//  $125 Million App
//
//  Created by CSOM on 2/4/17.
//  Copyright © 2017 CSOM. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var userInput:
    UITextField!
    
    @IBOutlet weak var resultsLabel:
    UILabel!
    
    @IBOutlet weak var fromUnitsLabel: UILabel!
    
    
    @IBOutlet weak var formulaPicker: UIPickerView!
    
    var formulasArray = ["miles to kilometers",
                         "kilometers to miles",
                         "feet to meters",
                         "yards to meters",
                         "meters to feet",
                         "meters to yards"]
    
    var toUnits = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        formulaPicker.dataSource = self
        formulaPicker.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //mark:- Delegates and DataSources
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return formulasArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return formulasArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        
        
        let unitsArray = formulasArray[row].components(separatedBy: " to ")
        fromUnitsLabel.text = unitsArray[0]
        toUnits = unitsArray[1]
        resultsLabel.text = toUnits
    }
    
    
    
    //mark:- @IBActions
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        
        let inputString = userIntput.text!
        
        if let miles = Double(inputString) {
            let km = miles * 1.6
            resultsLabel.text = "\(inputString) miles = \(km) = kilometers"
        } else {
            showAlert()
            // print("Error: \(inputString) is not a valid number. Please only enter numeric values, no commas, spaces, or symbols.")
        }
        
        }
    
}
