//
//  HomeView.swift
//  What2Eat
//
//  Created by johnny basgallop on 15/01/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    @EnvironmentObject var homeViewModel : HomeViewModel
    var body: some View {
        VStack{
            TopBar()
            Spacer()
            if let recipe = homeViewModel.randomRecipe {
                RecipeCardView(meal: recipe.meal , area: recipe.area, instructions: recipe.instructions, thumbnail: recipe.thumbnail, youtube: recipe.youtube).environmentObject(homeViewModel)
            }
            Spacer()
            RegenerateButton().padding(.bottom, 15)
            
        }
        
    }
}


struct TopBar: View {
    var body: some View {
        HStack{
            Text("What2Eat").font(.system(size: 35,weight: .bold)).padding().foregroundColor(Color("primaryColor"))
            Spacer()
            LogoutButton()
        }.padding(.trailing, 25)
            .padding(.leading, 10)
    }
}


struct LogoutButton :View {
    @EnvironmentObject var loginViewModel : LoginViewModel
    @State var logoutAlertShowing: Bool = false
    var body: some View {
        
        Button(action: {
            logoutAlertShowing = true
        }, label: {
            Image(systemName: "rectangle.portrait.and.arrow.right").rotationEffect(.degrees(180), anchor: .center).font(.system(size: 20)).padding(.trailing, 5).foregroundColor(Color("primaryColor"))})
        
        .alert(isPresented: $logoutAlertShowing) {
            Alert(
                title: Text("Logout of account"),
                message: Text("By confirming you will logout of your What2Eat account"),
                primaryButton: .default(Text("Logout")) {
                    loginViewModel.logout()
                },
                secondaryButton: .cancel(Text("Cancel")) {
                    logoutAlertShowing = false
                }
            )
        }
    }
}

struct RegenerateButton : View {
    @EnvironmentObject var homeViewModel : HomeViewModel
    var body: some View {
        Button(action: {
            homeViewModel.fetchRandomRecipe()
        }) {
            HStack{
                Text("Regenerate")
                
                    .foregroundColor(.white)
                    .font(.system(size: 16, weight: .bold))
                
                Image(systemName: "arrow.2.squarepath").font(.system(size: 17, weight: .bold)).foregroundColor(.white)
                
            }.frame(width: 300, height: 50)
        }
        .background(Color("primaryColor"))
        .cornerRadius(15)
    }
}

#Preview {
    HomeView()
        .environmentObject(HomeViewModel())
        .environmentObject(LoginViewModel())
}
