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
    
    @IBAction func appendDigit(sender: UIButton)
    {
        let digit = sender.currentTitle
        
        print("Append this digit: \(digit)")
    }
}

