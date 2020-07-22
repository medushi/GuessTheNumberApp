//
//  DatabaseHelper.swift
//  GuessTheNumberApp
//
//  Created by Muhamed Zeqiri on 19/07/2020.
//  Copyright © 2020 BM. All rights reserved.
//

import Foundation


class DBHelper
{
    init()
    {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "guessNumberDb.sqlite"
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
        let createTableString = "CREATE TABLE IF NOT EXISTS score(name TEXT,highscore INTEGER);"
        var createTableStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, createTableString, -1, &createTableStatement, nil) == SQLITE_OK
        {
            if sqlite3_step(createTableStatement) == SQLITE_DONE
            {
                print("person table created.")
            } else {
                print("person table could not be created.")
            }
        } else {
            print("CREATE TABLE statement could not be prepared.")
        }
        sqlite3_finalize(createTableStatement)
    }
    
    
    func insert(id:Int, name:String, age:Int)
    {
        let scores = read()
        for s in scores
        {

        }
        let insertStatementString = "INSERT INTO score (name, highscore) VALUES (?, ?);"
        var insertStatement: OpaquePointer? = nil
        if sqlite3_prepare_v2(db, insertStatementString, -1, &insertStatement, nil) == SQLITE_OK {
            sqlite3_bind_text(insertStatement, 1, (name as NSString).utf8String, -1, nil)
            sqlite3_bind_int(insertStatement, 2, Int32(highscore))
            
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
    
    func read() -> [ScoreModel] {
        let queryStatementString = "SELECT * FROM score;"
        var queryStatement: OpaquePointer? = nil
        var psns : [ScoreModel] = []
        if sqlite3_prepare_v2(db, queryStatementString, -1, &queryStatement, nil) == SQLITE_OK {
            while sqlite3_step(queryStatement) == SQLITE_ROW {
                let name = String(describing: String(cString: sqlite3_column_text(queryStatement, 0)))
                let highscore  = sqlite3_column_int(queryStatement, 1)
                psns.append(Person(name: name, highscore: Int(year)))
                print("Query Result:")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(queryStatement)
        return psns
    }
    
}
