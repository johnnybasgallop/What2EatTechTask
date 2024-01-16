//
//  LoginView.swift
//  MoneyBox
//
//  Created by Johnny Basgallop on 09/01/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    
    @State var email: String = ""
    @State var password: String = ""
    @State private var isSecure: Bool = true
    
    var body: some View {
        VStack {
            LoginIllustrationsView()
            
            
            LoginFields(email: $email, password: $password, isSecure: $isSecure)
                .offset(y: -screenWidth * 0.12)
            
            LoginButton(email: $email, password: $password)
                .offset(y: -screenWidth * 0.05)
        }
    }
}

struct LoginIllustrationsView: View {
    var body: some View {
        VStack {
            Text("What2Eat").font(.system(size: 40,weight: .bold)).padding().foregroundColor(Color("primaryColor"))
            
            Image("foodIllustration")
                .resizable()
                .frame(width: screenWidth * 0.7, height: screenWidth * 0.7)
                .onTapGesture {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            
            Spacer()
        }
    }
}

struct LoginFields: View {
    @Binding var email: String
    @Binding var password: String
    @Binding var isSecure: Bool
    
    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .padding(.horizontal, 10)
                .frame(width: screenWidth * 0.9, height: 42)
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding()
            
            PasswordField(password: $password, isSecure: $isSecure)
        }
        .padding()
    }
}

struct PasswordField: View {
    @Binding var password: String
    @Binding var isSecure: Bool
    
    var body: some View {
        ZStack(alignment: .trailing) {
            if isSecure {
                SecureField("Password", text: $password)
                    .padding(.horizontal, 10)
                    .frame(width: screenWidth * 0.9, height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                TextField("Password", text: $password)
                    .padding(.horizontal, 10)
                    .frame(width: screenWidth * 0.9, height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }
            
            Button(action: {
                isSecure.toggle()
            }) {
                Image(systemName: isSecure ? "eye.slash" : "eye")
                    .foregroundColor(.secondary)
            }
            .padding(.trailing, 8)
        }
    }
}

struct LoginButton: View {
    @EnvironmentObject var loginViewModel: LoginViewModel
    @Binding var email: String
    @Binding var password: String
    @State var isPresented : Bool = false
    
    var body: some View {
        Button(action: {
            loginViewModel.loginWithEmailAndPassword(email: email, password: password){success in}
        }) {
            Text("Login")
                .frame(width: 300, height: 50)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .bold))
        }
        .background(email.isEmpty == false && password.isEmpty == false ? Color("primaryColor") : Color.gray)
        .cornerRadius(10)
        
        .alert(isPresented: $isPresented ) {
            Alert(
                title: Text("Error logging in"),
                message: Text("Sorry we cant log you in at this time, try re-entering your email and password or waiting 5 minutes"),
                dismissButton:  .default(Text("Dismiss")) {
                    isPresented = false
                }
                
            )
        }
    }
}

#Preview {
    LoginView()
}

