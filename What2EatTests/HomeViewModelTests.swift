//
//  HomeViewModelTests.swift
//  What2EatTests
//
//  Created by johnny basgallop on 16/01/2024.
//

import XCTest
@testable import What2Eat

final class HomeViewModelTests: XCTestCase {

    func testSuccessfulRandomRecipeGeneration() {
        let homeViewModel = HomeViewModel()
        homeViewModel.randomRecipe = nil
        
        if homeViewModel.randomRecipe == nil {
            homeViewModel.fetchRandomRecipe()
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                XCTAssertNotNil(homeViewModel.randomRecipe)
            }
        }
        
    }

}
