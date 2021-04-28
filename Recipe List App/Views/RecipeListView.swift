//
//  RecipeListView.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-26.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("All Recipes")
                    .bold()
                    .padding(.top, 40)
                    .font(.largeTitle)
                ScrollView {
                    LazyVStack (alignment: .leading){
                        ForEach (model.recipes) { recipe in
                            NavigationLink(
                                
                                destination: RecipeDetailView(recipe: recipe),
                                
                                label: {
                                    
                                    // MARK: Row Item
                                    HStack (spacing: 20) {
                                        Image(recipe.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50)
                                            .clipped()
                                            .cornerRadius(5)
                                            .shadow(radius: 3)
                                        Text(recipe.name)
                                            .foregroundColor(.black)
                                        
                                    }
                                }
                                
                            )
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
    }
}
