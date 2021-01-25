//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Niveda Balananthan on 2021-01-24.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var lowButton: UIStepper!
    
    @IBOutlet weak var medButton: UIStepper!
    @IBOutlet weak var highButton: UIStepper!
    
    @IBOutlet weak var lowLabel: UILabel!
    
    @IBOutlet weak var medLabel: UILabel!
    
    @IBOutlet weak var highLabel: UILabel!
    
    let defaults = UserDefaults.standard

    var lowest: Int=0
    var med: Int=15
    var high: Int=20
    
    override func viewDidLoad() {
        super.viewDidLoad()

        lowest = defaults.integer(forKey: "lowTipKey")
        med = defaults.integer(forKey: "medTipKey")
        high = defaults.integer(forKey: "highTipKey")


        lowButton.wraps = true
        lowButton.minimumValue = 0
        lowButton.maximumValue = 30
        // Do any additional setup after loading the view.
    }
    
   
    @IBAction func lowValueChanged(_ sender: UIStepper) {
        
        lowLabel.text = Int(sender.value).description
        lowest = Int(sender.value)
    }
    
    @IBAction func medValueChanged(_ sender: UIStepper) {
        medLabel.text = Int(sender.value).description
        med = Int(sender.value)
    
    }
    
    
    @IBAction func highValueChanged(_ sender: UIStepper) {
        highLabel.text = Int(sender.value).description
        high = Int(sender.value)
        
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
        defaults.set(lowest, forKey: "lowTipKey")
        defaults.set(med, forKey: "medTipKey")
        defaults.set(high, forKey: "highTipKey")
        defaults.synchronize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        lowLabel.text = defaults.string(forKey:"lowTipKey")
        medLabel.text = defaults.string(forKey:"medTipKey")
        highLabel.text = defaults.string(forKey:"highTipKey")

        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
