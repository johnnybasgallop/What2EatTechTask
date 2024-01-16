//
//  LoginViewModel.swift
//  What2Eat
//
//  Created by johnny basgallop on 15/01/2024.
//

import Foundation
import SwiftUI

final class LoginViewModel: ObservableObject {
    
    @Published var testUserAccountEmail : String = "artlume.io@example.com"
    @Published var testUserAccountPassword : String = "P455Word12"
    @AppStorage ("loggedIn") var loggedIn : Bool = false
    
    func loginWithEmailAndPassword(email: String, password: String, completion: @escaping (Bool) -> Void){
        if email == testUserAccountEmail && password == testUserAccountPassword {
            
            withAnimation{
                self.loggedIn = true
            }
            
            completion(true)
            
        }
    }
    
    
    
    func logout()  {
        self.loggedIn = false
    }
}
