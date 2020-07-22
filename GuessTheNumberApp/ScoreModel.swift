//
//  ScoreModel.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 19/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import Foundation

class ScoreModel
{
    
    var name: String = ""
    var highscore: Int = 0
    
    init(name:String, highscore:Int)
    {
        self.name = name
        self.highscore = highscore
    }
    
}

