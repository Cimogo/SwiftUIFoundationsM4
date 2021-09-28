//
//  DataService.swift
//  RecipeList
//
//  Created by Todd Farris on 9/23/21.
//

import Foundation

class DataService {
    
    static func getLoclaData() -> [Recipe] {
        //parse local Json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Get a url path to json file
        // guard means - check if pathString is not nil otherwise
        
        guard pathString != nil else {
            return [Recipe]()
        }
            
            // create a url object
        let url = URL(fileURLWithPath: pathString!)
            
        do {
            // create a data object
            let data = try Data(contentsOf: url)
                
            //decode data with json data
            let decoder = JSONDecoder()
            
                do {
                
                    let recipeData = try decoder.decode([Recipe].self, from: data)
                    
                    
                    // add the unique Ids
                    for r in recipeData {
                        r.id = UUID()
                    }
                // return the recipes
                    return recipeData
                    }
                catch {
                        print (error)
                }
            }
            catch{
                print(error)
        }
        return [Recipe]()
    }
    
}
