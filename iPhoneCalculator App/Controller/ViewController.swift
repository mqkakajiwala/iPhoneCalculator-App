//
//  ViewController.swift
//  iPhoneCalculator App
//
//  Created by Mustafa on 18/12/2018.
//  Copyright © 2018 Mustafa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    @IBOutlet weak var displayLabel: UILabel!
    
    //MARK: - Instance variables
    private var calculator = CalculatorLogic()
    private var didFinishTyping: Bool = true
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label into a double value.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        didFinishTyping = true
        calculator.setNumber(displayValue)
        
        if let calcMethod = sender.currentTitle  {
            if let result = calculator.calculatorLogic(symbol: calcMethod) {
                displayValue = result
            }
          
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            if didFinishTyping {
                displayLabel.text = numValue
                didFinishTyping = false
            }else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
    }
}


