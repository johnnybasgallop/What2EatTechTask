//
//  RecipeCardView.swift
//  What2Eat
//
//  Created by johnny basgallop on 15/01/2024.
//

import SwiftUI

struct RecipeCardView: View {
    var meal: String
    var area: String
    var instructions: String
    var thumbnail: String
    var youtube: String
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: screenWidth * 0.9, height: screenWidth * 1.1)
                .foregroundColor(.white)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0, y: 4)
            
            VStack(alignment: .leading){
                FoodImg(thumbnail: thumbnail)
                Spacer()
                Text("\(meal)").padding(.horizontal, 20).font(.system(size: 28, weight: .semibold))
                Tags(area: area, youtube: youtube).padding(.bottom, 20)
                
            }.frame(width: screenWidth * 0.9, height: screenWidth * 1.1)
        }
        
        
    }
}


struct FoodImg : View {
    var thumbnail : String
    var body: some View {
        AsyncImage(url: URL(string: thumbnail)){image in
            image.resizable()
                .frame(width: screenWidth * 0.9, height: screenWidth * 0.8)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        }
        
    placeholder: {
        ProgressView()
    }
    }
}

struct Tags : View {
    var area : String
    var youtube : String
    var body: some View {
        HStack{
            AreaButton(area: area)
            YoutubeButton(youtube: youtube)
        }.padding(.horizontal, 20)
    }
}

struct AreaButton : View {
    var area : String
    var body: some View {
        Button(action: {
            //
        }, label: {
            Text("\(area)").padding(.horizontal, 15).padding(.vertical, 3).foregroundColor(Color("primaryColor"))
        }) .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("primaryColor"), lineWidth: 2)
        )
    }
}


struct YoutubeButton : View {
    @Environment(\.openURL) var openURL
    var youtube : String
    var body: some View {
        Button(action: {
            if let youtubeURL = URL(string: youtube) {
                openURL(youtubeURL)
            }
        }, label: {
            HStack{
                Text("Youtube").foregroundColor(Color("primaryColor"))
                Image(systemName: "arrow.up.forward.app").foregroundColor(Color("primaryColor")).frame(width: 8)
            }.padding(.horizontal, 15).padding(.vertical, 3)
        }) .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color("primaryColor"), lineWidth: 2)
        )
    }
}



