//
//  StatsViewController.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 19/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import UIKit

class StatsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource

   
{  @IBOutlet weak var tableView: UITableView!

    let cellReuseIdentifier = "cell"

    var db:DBHelper = DBHelper()

    var scores:[HighScoreModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        scores=db.read()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return scores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        cell.textLabel?.text = "Lojtari: " + scores[indexPath.row].playerName + ", " + "Tentime: " + String(scores[indexPath.row].numberOfTries)
        
        return cell
    }
    
}
