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
    @IBOutlet weak var btnSaveResults: UIButton!
    @IBOutlet weak var tfPlayerName: UITextField!
    
    var databaseHelper:DBHelper = DBHelper()
    
    var correctNumber = 0
    var playername:String = ""
    var totalTriesCounter:Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        btnSaveResults.isHidden=true
        lblProgressMessage.text=""
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewDidAppear(_ animated: Bool) {
        let infoAlert = UIAlertController(title:"Rregullat e lojes",message:"1. Kliko gjenero per te marre nje numer  1-20\n2.Sheno numrin qe mendon dhe kliko QELLO deri sa te gjesh numrin\n3.Kliko ruaj pasi te kesh qelluar per ta ruajtur rezultatin",preferredStyle: .alert)
        infoAlert.addAction(UIAlertAction(title:"Ne rregull",style: .cancel, handler:nil))
        self.present(infoAlert,animated:true,completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    
    @IBAction func generateNumber(_ sender: UIButton) {
        correctNumber=Int(arc4random_uniform(20)+1)
        btnSaveResults.isHidden=true
        print(correctNumber)
    }
    
    @IBAction func guessNumber(_ sender: Any) {
        var guessedNumber:Int = Int(tfGuessedNumber.text!)!
        if(guessedNumber > correctNumber){
            lblProgressMessage.text="ME I VOGEL!"
            totalTriesCounter=totalTriesCounter+1
        }
        if(guessedNumber < correctNumber){
            lblProgressMessage.text="ME I MADH!"
            totalTriesCounter=totalTriesCounter+1
        }
        else if(guessedNumber==correctNumber){
            lblProgressMessage.text="SAKTE"
            btnSaveResults.isHidden=false
            
        }
    }
    @IBAction func saveScore(_ sender: UIButton) {
        playername=String(tfPlayerName.text!)
        print(totalTriesCounter)
        databaseHelper.insert(firstname: playername,score: totalTriesCounter)
        tfGuessedNumber.text=""
        tfPlayerName.text=""
        correctNumber=Int(arc4random_uniform(20)+1)
        self.makeToastMsg(message: "Loja mbaroi...Kliko Gjenero per te filluar loje te re",font: .systemFont(ofSize: 12.0))
    }
    
    func makeToastMsg(message: String,font: UIFont)
    {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2-30,y: self.view.frame.size.height-100,width: 300,height:35))
        toastLabel.backgroundColor=UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor=UIColor.white
        toastLabel.font=font
        toastLabel.textAlignment = .center
        toastLabel.text=message
        toastLabel.alpha=1.0
        toastLabel.layer.cornerRadius=10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 7.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha=0.0
        }, completion: {(isCompleted) in toastLabel.removeFromSuperview()})
        
    }
}

