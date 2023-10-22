//
//  ViewController.swift
//  IntroToiOS
//
//  Created by Saba Gogrichiani on 21.10.23.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var titleHolder: UILabel!
    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    @IBOutlet weak var calculatedNum: UILabel!
    @IBOutlet weak var calculateSwitcher: UISwitch!
    
    // MARK: - Calculate Button Action
    @IBAction func calcButton(_ sender: Any) {
        guard let num1 = Int(firstNum.text ?? ""), let num2 = Int(secondNum.text ?? "") else {
            calculatedNum.text = "Invalid input"
            firstNum.layer.borderWidth = 1.0
            secondNum.layer.borderWidth = 1.0
            firstNum.layer.borderColor = UIColor.red.cgColor
            secondNum.layer.borderColor = UIColor.red.cgColor
            return
        }
        
        if calculateSwitcher.isOn {
            calculatedNum.text = String(gcd(num1, num2))
        } else {
            calculatedNum.text = String(lcm(num1, num2))
        }
    }

    // MARK: - Calculate Greatest Common Divisor
    func gcd(_ x: Int, _ y: Int) -> Int {
        var a = 0
        var b = max(x, y)
        var r = min(x, y)
        
        while r != 0 {
            a = b
            b = r
            r = a % b
        }
        return b
    }

    // MARK: - Calculate Least Common Multiple
    func lcm(_ x: Int, _ y: Int) -> Int {
        return x / gcd(x, y) * y
    }

    // MARK: - Switch Action
    @IBAction func funcSwitch(_ sender: UISwitch) {
        if sender.isOn {
            titleHolder.text = "Greatest common divisor"
        } else {
            titleHolder.text = "Least common multiple"
        }
    }
}
