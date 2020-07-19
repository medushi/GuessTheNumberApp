//
//  ViewController.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 16/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblProgressMessage: UILabel!
    @IBOutlet weak var tfGuessedNumber: UITextField!
    
    var correctNumber = Int(arc4random_uniform(20)+1)
    var totalTriesCounter = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    @IBAction func generateNumber(_ sender: UIButton) {
       print(correctNumber)
    }
    
    @IBAction func guessNumber(_ sender: Any) {
        var guessedNumber:Int = Int(tfGuessedNumber.text!)!
        
        if(guessedNumber > correctNumber){
            lblProgressMessage.text="ME I VOGEL!"
        }
        if(guessedNumber < correctNumber){
            lblProgressMessage.text="ME I MADH!"
        }
        else if(guessedNumber==correctNumber){
            lblProgressMessage.text="SAKTE"
        }
    }
}

