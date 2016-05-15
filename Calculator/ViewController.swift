//
//  ViewController.swift
//  Calculator
//
//  Created by David Brunow on 3/13/16.
//  Copyright © 2016 TechMill. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!
    
    var brain = CalculatorBrain()
    var isInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle!
        
        if isInTheMiddleOfTypingANumber
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            isInTheMiddleOfTypingANumber = true
        }
        print("Append this digit: \(digit)")
    }
    
    var displayValue: Double
    {
        get
        {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set
        {
            display.text = "\(newValue)"
        }
    }
    
    @IBAction func enter()
    {
        isInTheMiddleOfTypingANumber = false
        
        brain.pushOperand(displayValue)
    }
    
    @IBAction func operate(sender: UIButton)
    {
        let operation = sender.currentTitle!
        
        if isInTheMiddleOfTypingANumber
        {
            enter()
        }
        
        brain.performOperation(operation)
        
        if let newDisplayValue = brain.evaluate()
        {
            displayValue = newDisplayValue
        }
    }
}

