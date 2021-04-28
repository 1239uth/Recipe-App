//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Uthman Mohamed on 2021-04-27.
//

import SwiftUI

struct RecipeTabView: View {
    
    var body: some View {
        TabView {
            
            RecipeListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("List")
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
            
            RecipeFeaturedView()
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                            .font(Font.custom("Avenir", size: 15))
                    }
                }
        }
        .environmentObject(RecipeModel())
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
