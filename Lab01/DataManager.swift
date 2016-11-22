//
//  DataManager.swift
//  Day_05
//
//  Created by Admin on 10/16/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import Foundation

let kDatabaseName = "pokemon"
let kDatabaseExtension = "db"

class DataManager: NSObject {
    var pokemons : [pokemon]?
    
    static let defautManager = DataManager()
    
    func getDatabaseFolderPath() -> String {
        let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory , .userDomainMask, true)[0]
        return documentPath + "/" + kDatabaseName + "." + kDatabaseExtension
    }
    
    // 1.Copy database
    func copyDatabaseIfNeed() {
        let bundlePath = Bundle.main.path(forResource: kDatabaseName, ofType: kDatabaseExtension)
    // 2. Get document path
        let documentPath = self.getDatabaseFolderPath()
        print(documentPath)
    // 3. Check if file exist
        if !FileManager.default.fileExists(atPath: documentPath)
        {
            // 4. copy from bundlePath to documentPath
            do{
                print(String(describing: bundlePath) + String(documentPath))
                try FileManager.default.copyItem(atPath: bundlePath!, toPath: documentPath)
            } catch {
                print(error)
            }
        }
    }
    
    func selectAllStudent() -> [pokemon] {
        
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        
        let select = "select * from [pokemon] order by random() limit 1"
        
        do{
            let result = try database?.executeQuery(select, values: nil)
            self.pokemons = [pokemon]()
            while (result?.next())! {
                let pk = pokemon()
                pk.name = result?.string(forColumn: "name")
                pk.id = Int((result?.int(forColumn: "Id"))!)
                pk.tag = result?.string(forColumn: "tag")
                pk.image = result?.string(forColumn: "img")
                pk.gen = Int((result?.int(forColumn: "gen"))!)
                pk.color = result?.string(forColumn: "color")
                
                pokemons?.append(pk)
                
            }
            print("Select Successfully")
        } catch {
            print("Error:",error)
        }
        
        return pokemons!
        
        database?.close()
    }
    
    func insertStudent() {
        // 1.Open database
        let database = FMDatabase(path: self.getDatabaseFolderPath())
        database?.open()
        // 2. Create query
        let insertS = "INSERT INTO Student VALUES (1,'HauBui',27)"
         // 3.Excute query
        do {
            try database?.executeUpdate(insertS, values: nil)
            print("Suscess")
        } catch {
            print("error: ",error)
        }
        

        
        // 4.Close connect
        database?.close()
    }
}
