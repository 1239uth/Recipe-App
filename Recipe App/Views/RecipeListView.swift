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
                    .font(Font.custom("Avenir Heavy", size: 24))
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
                                            .shadow(color: Color(.label), radius: 3)
                                        VStack (alignment: .leading){
                                            Text(recipe.name)
                                                .font(Font.custom("Avenir Heavy", size: 16))
                                            RecipeHighlights(highlights: recipe.highlights)
                                        }
                                        .foregroundColor(Color.init(.label))
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
            .preferredColorScheme(.dark)
            .environmentObject(RecipeModel())
    }
}
