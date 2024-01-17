//
//  LoginViewModelTests.swift
//  What2EatTests
//
//  Created by johnny basgallop on 16/01/2024.
//

import XCTest
@testable import What2Eat

final class LoginViewModelTests: XCTestCase {

    func testSuccessfulLoginWithEmailAndPassword() {
        let loginViewModel = LoginViewModel()
        loginViewModel.loggedIn = false
        
        if loginViewModel.loggedIn == false {
            loginViewModel.loginWithEmailAndPassword(email: "artlume.io@example.com", password:"P455Word12"){success, message in
                if success{
                    XCTAssertTrue(loginViewModel.loggedIn)
                }
            }
        }
       
    }
    
    
    func testSuccessfulLogout(){
        let loginViewModel = LoginViewModel()
        loginViewModel.loggedIn = true
        
        if loginViewModel.loggedIn == true{
            loginViewModel.logout()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                XCTAssertFalse(loginViewModel.loggedIn)
            }
        }
    }

}
