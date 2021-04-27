//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-26.
//

import SwiftUI

struct RecipeListView: View {
    
    @ObservedObject var model = RecipeModel()
    
    var body: some View {
        NavigationView {
            List(model.recipes) { recipe in
                NavigationLink(
                    
                    destination: RecipeDetailView(recipe: recipe),
                    
                    label: {
                        HStack (spacing: 20) {
                            Image(recipe.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 50, height: 50)
                                .clipped()
                                .cornerRadius(6)
                                .shadow(radius: 3)
                            Text(recipe.name)
                                
                        }
                    }
                    
                )
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}
