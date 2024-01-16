//
//  ContentView.swift
//  MoneyBox
//
//  Created by johnny basgallop on 09/01/2024.
//

import SwiftUI



//Getting screen height and width values for quick and easy responsive sizing
let screenHeight = UIScreen.main.bounds.height
let screenWidth = UIScreen.main.bounds.width

struct ContentView: View {
    @StateObject var loginViewModel = LoginViewModel()
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            if loginViewModel.loggedIn == false{
                
                LoginView().environmentObject(loginViewModel)
                
            }
            
            
            
            else if loginViewModel.loggedIn  {
                HomeView().environmentObject(loginViewModel)
                    .environmentObject(homeViewModel)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                            homeViewModel.fetchRandomRecipe()
                        }
                        
                    }
            }
            
        }
        
    }
}




#Preview {
    ContentView()
}
