//
//  RecipeModel.swift
//  What2Eat
//
//  Created by johnny basgallop on 15/01/2024.
//

import Foundation

struct RecipeModel: Codable {
    var meal: String
    var area: String
    var instructions: String
    var thumbnail: String
    var youtube: String
    
    private enum CodingKeys: String, CodingKey {
        case meal = "strMeal"
        case area = "strArea"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtube = "strYoutube"
    }
}
