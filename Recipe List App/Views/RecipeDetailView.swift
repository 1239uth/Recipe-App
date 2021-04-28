//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-27.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            VStack (alignment: .leading){
                // MARK: Recipe Image
                Image(recipe.image)
                    .resizable()
                    .scaledToFit()
                
                Divider()
                
                // MARK: Ingredients
                VStack (alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding(.bottom, 6)
                    
                    ForEach (recipe.ingredients) { item in
                        Text("- " + item.name)
                            .padding(.bottom, 0.5)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                VStack (alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding(.bottom, 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index+1) + ".  " + recipe.directions[index])
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)
                
                Divider()
                
                // MARK: Directions
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = RecipeModel()
        
        RecipeDetailView(recipe: model.recipes[0])
    }
}
