//
//  RecipeModel.swift
//  RecipeList
//
//  Created by Todd Farris on 9/23/21.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        //create and instance of data services and get the data
        self.recipes = DataService.getLoclaData()
        
    }
}
