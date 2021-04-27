//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-26.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        recipes = DataService.getLocalData()
    }
    
}
