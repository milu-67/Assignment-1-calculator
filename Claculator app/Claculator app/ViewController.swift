//
//  ViewController.swift
//  Claculator app
//
//  Created by Malav R Shah on 10/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    var fnum: String = "";
    var operation: String = "";
    var snum: String = "";
    var haveresult: Bool = false;
    var resultnum: String = "";
    var num: String = "";
    var extra: String = "";
    var launch: Bool = false;
    
    //to connect every button with view controller
    @IBOutlet var calcbtns: [UIButton]!
    //@IBOutlet var calcbtns: [UIButton]!
    
    //defining operations here
    @IBAction func addition(_ sender: Any) {
        operation = "+"
    }
    
    @IBAction func subtraction(_ sender: Any) {
        operation = "-"
    }
    
    @IBAction func multipication(_ sender: Any) {
        operation = "x"
    }
    
    @IBAction func division(_ sender: Any) {
        operation = "/"
    }
    
    //when you press equal to
    @IBAction func equal(_ sender: Any) {
        resultnum = String(operate())
        let numarr = resultnum.components(separatedBy: ".")
        if numarr[1] == "0"{
            output.text = numarr[0]
        }
        else {
            output.text = resultnum
        }
        extra = "";
    }
    
    //connecting lable with output
    @IBOutlet weak var output: UILabel!
    
    
    @IBAction func back(_ sender: Any) {
        operation = "🔙"
        if(!output.text!.isEmpty){
            if(output.text!.count == 1)
            {
                output.text = "0"
                launch = true;
            }
            else
            {
                output.text?.removeLast()
                //fnum = String(output.text)
                if(output.text == "0"  && operation == ""){
                    fnum = output.text ?? ""
                }
                else if output.text == "0" && operation != ""{
                    snum = output.text ?? ""
                }
            }
        }
    }
    
    //when you press any number
    @IBAction func Press(_ sender: Any) {
        if operation == ""{
            fnum += String((sender as AnyObject).tag)
            output.text = fnum
        }
        else if operation != "" && !haveresult {
            snum  += String((sender as AnyObject).tag)
            output.text = snum
        }
        else if operation != "" && haveresult {
            extra += String((sender as AnyObject).tag)
            output.text = extra
        }
    }
    
    // all clear function
    @IBAction func Aalclear(_ sender: Any) {
        output.text = "0"
        fnum = "";
        operation = "";
        snum = "";
        haveresult = false;
        resultnum = "";
        num = "";
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // to represent buttons in circle
        for button in calcbtns {
            button.layer.cornerRadius = button.frame.size.height / 2;
        }
    }
    
    // function when the all operations are done
    func operate() -> Double {
        switch operation {
        case "+":
            if !haveresult {
                haveresult = true
                return Double(fnum)! + Double(snum)!
            }
            else {
                return Double(resultnum)! + Double(extra)!
            }
        case "-":
            if !haveresult {
                haveresult = true
                return Double(fnum)! - Double(snum)!
            }
            else {
                return Double(resultnum)! - Double(extra)!
            }
        case "x":
            if !haveresult {
                haveresult = true
                return Double(fnum)! * Double(snum)!
            }
            else {
                return Double(resultnum)! * Double(extra)!
            }
        case "/":
            if !haveresult && snum != "0"{
                haveresult = true
                return Double(fnum)! / Double(snum)!
            }
            else if haveresult && snum != "0"{
                return Double(resultnum)! / Double(extra)!
            }
            else{
                return Double(0.0)
            }
        default:
            return Double(resultnum)!
        }
    }
}
