//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Niveda Balananthan on 2021-01-24.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    
    @IBOutlet weak var billAmountTextField: UITextField!
    
    @IBOutlet weak var tipAmountLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Tip Calculator"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billAmountTextField.text!) ?? 0
        
        
        let tipPercentages = [ Double(defaults.float(forKey:"lowTipKey"))/100.0, Double(defaults.float(forKey:"medTipKey"))/100.0, Double(defaults.float(forKey:"highTipKey"))/100.0]
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        tipControl.setTitle("\(defaults.integer(forKey: "lowTipKey"))%", forSegmentAt:0)
        
        tipControl.setTitle("\(defaults.integer(forKey: "medTipKey"))%", forSegmentAt:1)
        
        tipControl.setTitle("\(defaults.integer(forKey: "highTipKey"))%", forSegmentAt:2)
        
    }

    

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did disappear")
    }
    

}

