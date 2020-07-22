//
//  DBHelper.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 19/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import Foundation
import SQLite3
class DBHelper
    {
        init()
        {
            db = openDatabase()
            createTable()
        }
        
        let dbPath: String = "guessTheNumberAppDb.sqlite"
        var db:OpaquePointer?
        
        func openDatabase() -> OpaquePointer?
        {
            let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent(dbPath)
            var db: OpaquePointer? = nil
            if sqlite3_open(fileURL.path, &db) != SQLITE_OK
            {
                print("error opening database")
                return nil
            }
            else
            {
                print("Successfully opened connection to database at \(dbPath)")
                return db
            }
        }
        
        func createTable() {
            let createTableString = "CREATE TABLE IF NOT EXISTS highscore(playerName TEXT,numberOfTries INTEGER);"
            var createTableStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
            {
                if sqlite3_step(createTableStatement) == SQLITE_DONE
                {
                    print("table created.")
                } else {
                    print("table could not be created.")
                }
            } else {
                print("CREATE TABLE statement could not be prepared.")
            }
            sqlite3_finalize(createTableStatement)
        }
        
        
        func insert(firstname:String, score:Int)
        {
            let players = read()
            for player in players
            {
                if(player.playerName == "")
                {
                    return
                }
            }
            let insertStatementString = "INSERT INTO highscore (playerName, numberOfTries) VALUES (?, ?);"
            var insertStatement: OpaquePointer? = nil
            if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
                sqlite3_bind_text(insertStatement, 1, (firstname as NSString).utf8String, -1, nil)
                sqlite3_bind_int(insertStatement, 2, Int32(score))
                
                if sqlite3_step(insertStatement) == SQLITE_DONE {
                    print("Successfully inserted row.")
                } else {
                    print("Could not insert row.")
                }
            } else {
                print("INSERT statement could not be prepared.")
            }
            sqlite3_finalize(insertStatement)
        }
        
        func read() -> [HighScoreModel] {
            let queryStatementString = "SELECT * FROM highscore WHERE numberOfTries>0 ORDER BY numberOfTries ASC;"
            var queryStatement: OpaquePointer? = nil
            var psns : [HighScoreModel] = []
            if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
                while sqlite3_step(queryStatement) == SQLITE_ROW {
                    let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                    let score = sqlite3_column_int(queryStatement, 1)
                    psns.append(HighScoreModel(playerName: name, numberOfTries: Int(score)))
                    print("Query Result:")
                }
            } else {
                print("SELECT statement could not be prepared")
            }
            sqlite3_finalize(queryStatement)
            return psns
        }
}
