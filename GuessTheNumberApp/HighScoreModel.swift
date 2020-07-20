//
//  HighScoreModel.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 19/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import Foundation

class HighScoreModel
{
    var playerName:String=""
    var numberOfTries: Int=0
    
    init(playerName:String,numberOfTries:Int)
    {
        self.playerName=playerName
        self.numberOfTries=numberOfTries
    }
}
