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
        fromUnitsLabel.text = formulasArray[row]
    }
    
    
    
    //mark:- @IBActions
    
    @IBAction func convertButtonPressed(_ sender: UIButton) {
        
        if let cups = Double(userInput.text!){
            let oz = cups * 8
            let tbsp = cups * 16
            let quarts = cups * 0.25
            let pints = cups * 0.5
            
            resultsLabel.text = "\(cups) cups = \(oz) ounces, \(tbsp) tablespoons, \(quarts) quarts, or \(pints) pints"
            
        }else{
            resultsLabel.text = ""
            
            let titleString = "error"
            let messageString = "\(userInput.text!) is not a valid number"
            let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            
        }
        
    }
    
}
