//
//  ViewController.swift
//  Multiply Numbers
//
//  Created by Runyao Xia on 9/14/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtFirstNumber: UITextField!
    
    @IBOutlet weak var txtSecondNumber: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func multiply(_ sender: Any) {
        let firstNum = Int(txtFirstNumber.text ?? "0") ?? 0
        let secondNum = Int(txtSecondNumber.text ?? "0") ?? 0
        let product = firstNum * secondNum
        
        lblResult.text = String(product)
    }
}

