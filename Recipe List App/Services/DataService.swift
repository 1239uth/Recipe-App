//
//  DataService.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-27.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        // Parse local json file
        
        // get path from the file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        
        guard pathString != nil else { return [Recipe]() }
        
        //get url from the path
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            
            // get data from url
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                for eachData in recipeData {
                    eachData.id = UUID()
                }
                
                return recipeData
                
            } catch  {
                print(error)
            }
            
        } catch  {
            print(error)
        }
        return [Recipe]()
    }
    
}
