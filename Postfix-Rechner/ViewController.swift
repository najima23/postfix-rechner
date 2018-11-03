//
//  ViewController.swift
//  Postfix-Rechner
//
//  Created by Najima Jaadari on 28.10.18.
//  Copyright © 2018 Najima Jaadari. All rights reserved.
//

import UIKit
extension String: Error {}

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var displayInput: UITextView!
    var paddingLabel = PaddingLabel(frame: CGRect(x: 50, y: 120, width: 300, height: 50))
    
    var numberOne = ""
    var numberTwo = ""
    var summe:Int?
    var ops: String?
    
    func setLabel(value : String){
        
        do{
            if(ops != nil){
                numberTwo = numberTwo + String(value)
                if(ops == nil) {throw("Error")}
                
                paddingLabel.text = numberOne + ops! + numberTwo
            }else{
                numberOne =  numberOne + String(value)
                paddingLabel.text = numberOne
            }
        }catch{
            paddingLabel.text = "FORMAT falsch: zahl, ops, zahl, equal"
        }
    }
    
    func setOps(opss : String){
        paddingLabel.text = "\(numberOne) \(opss)"
        ops = opss
    }
    
    //Number Buttons
    @IBAction func n0(_ sender: UIButton) {
        setLabel(value: "0")
    }
    
    @IBAction func n1(_ sender: UIButton) {
        setLabel(value: "1")
    }
    
    @IBAction func n2(_ sender: UIButton) {
        setLabel(value: "2")
    }
    
    @IBAction func n3(_ sender: UIButton) {
        setLabel(value: "3")
    }
    
    @IBAction func n4(_ sender: UIButton) {
        setLabel(value: "4")
    }
    @IBAction func n5(_ sender: UIButton) {
        setLabel(value: "5")
    }
    
    @IBAction func n6(_ sender: UIButton) {
        setLabel(value: "6")
    }
    
    @IBAction func n7(_ sender: UIButton) {
        setLabel(value: "7")
    }
    
    @IBAction func n8(_ sender: UIButton) {
        setLabel(value: "8")
    }
    
    @IBAction func n9(_ sender: UIButton) {
        setLabel(value: "9")
    }
    
    @IBAction func calcPlus(_ sender: UIButton) {
        setOps(opss: "+")
    }
    
    @IBAction func calcMinus(_ sender: UIButton) {
        setOps(opss: "-")
    }
    
    @IBAction func calcMult(_ sender: UIButton) {
        setOps(opss: "*")
    }
    
    @IBAction func caldDiv(_ sender: UIButton) {
        setOps(opss: "/")
    }
    
    @IBAction func clear(_ sender: UIButton) {
        paddingLabel.text = ""
        ops = nil
        numberOne = ""
        numberTwo = ""
    }
    
    @IBAction func equal(_ sender: UIButton) {
        let num1 = Int(numberOne)!;
        let num2 = Int(numberTwo)!;
        
        switch ops {
        case "+":
            summe = num1 + num2
            break
        case "-":
            summe = num1 - num2
            break
        case "*":
            summe = num1 * num2
            break
        case "/":
            summe = num1 / num2
            break
        default:
            paddingLabel.text = "ERROR"
        }
        numberOne = String(summe!)
        paddingLabel.text = String(summe!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paddingLabel.center = CGPoint(x: 200, y: 120)
        paddingLabel.textAlignment = .center
        paddingLabel.text = ""
        paddingLabel.backgroundColor = UIColor(red: 0, green: 119, blue: 204, alpha: 1)
        
        self.view.addSubview(paddingLabel)
    }
}

