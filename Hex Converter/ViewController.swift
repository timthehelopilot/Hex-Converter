//
//  ViewController.swift
//  Hex Converter
//
//  Created by Timothy Barrett on 10/20/16.
//  Copyright © 2016 Timothy Barrett. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var choiceSegment: UISegmentedControl!
    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    @IBOutlet weak var textFieldThree: UITextField!
    @IBOutlet weak var convertButton: UIButton!
    @IBOutlet weak var finalResultLabel: UILabel!
    
    var hexPartOne : String?
    var hexPartTwo : String?
    var hexPartThree : String?
    var redValue : Int?
    var greenValue : Int?
    var blueValue : Int?
    var conversionType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func choiceSegementChosen(_ sender: UISegmentedControl) {
        switch choiceSegment.selectedSegmentIndex {
        case 0:
            conversionType = "Hex to RGB"
            textFieldOne.placeholder = "1st and 2nd hex characters"
            textFieldTwo.placeholder = "3rd and 4th hex character"
            textFieldThree.placeholder = "5th and 6th hex character"
            textFieldOne.keyboardType = UIKeyboardType.default
            textFieldTwo.keyboardType = UIKeyboardType.default
            textFieldThree.keyboardType = UIKeyboardType.default
        case 1:
            conversionType = "RGB to Hex"
            textFieldOne.placeholder = "Red value"
            textFieldTwo.placeholder = "Green value"
            textFieldThree.placeholder = "Blue value"
            textFieldOne.keyboardType = UIKeyboardType.numberPad
            textFieldTwo.keyboardType = UIKeyboardType.numberPad
            textFieldThree.keyboardType = UIKeyboardType.numberPad
        default:
            conversionType = ""
        }
    }
    
    
    @IBAction func convertButtonTapped(_ sender: UIButton) {
        switch conversionType {
        case "Hex to RGB":
            if assignHexValues() == true {
                convertHexToInt()
                displayRGBValues()
            }
        case "RGB to Hex":
            if assignRGBValues() == true {
                convertIntToHex()
                displayHexValue()
            }
        default:
            break
        }
        textFieldOne.text?.removeAll()
        textFieldTwo.text?.removeAll()
        textFieldThree.text?.removeAll()

        
    }
    
    func assignHexValues() -> Bool {
        if !textFieldOne.hasText || !textFieldTwo.hasText || !textFieldThree.hasText {
            titleLabel.text = "Enter all values below"
            return false
        } else {
            hexPartOne = textFieldOne.text
            hexPartTwo = textFieldTwo.text
            hexPartThree = textFieldThree.text
            titleLabel.text = "Choose a conversion and enter numbers"
        }
        return true
    }
    
    func assignRGBValues () -> Bool {
        if !textFieldOne.hasText || !textFieldTwo.hasText || !textFieldThree.hasText {
            titleLabel.text = "Enter all values below"
            return false
        } else {
            redValue = Int(textFieldOne.text!)
            greenValue = Int(textFieldTwo.text!)
            blueValue = Int(textFieldThree.text!)
            titleLabel.text = "Choose a conversion and enter numbers"
        }
        return true
    }
    
    func convertHexToInt() {
        redValue = strtol(hexPartOne, nil, 16)
        greenValue = strtol(hexPartTwo, nil, 16)
        blueValue = strtol(hexPartThree, nil, 16)
    }
    
    func displayRGBValues() {
        finalResultLabel.text = "Red value is: \(redValue!), Green value is: \(greenValue!), Blue value is: \(blueValue!)."
        finalResultLabel.backgroundColor = UIColor.init(red: CGFloat(redValue!)/255, green: CGFloat(greenValue!)/255, blue: CGFloat(blueValue!)/255, alpha: 1)
    }
    
    func convertIntToHex() {
        hexPartOne = String(format: "%0.2x", redValue!)
        hexPartTwo = String(format: "%0.2x", greenValue!)
        hexPartThree = String(format: "%0.2x", blueValue!)
    }
    
    func displayHexValue() {
        finalResultLabel.text = " Hexcode value is: 0x\(hexPartOne!)\(hexPartTwo!)\(hexPartThree!)"
        finalResultLabel.backgroundColor = UIColor.init(red: CGFloat(redValue!)/255, green: CGFloat(greenValue!)/255, blue: CGFloat(blueValue!)/255, alpha: 1)

    }
    
}

