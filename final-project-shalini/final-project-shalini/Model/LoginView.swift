//
//  SignUpView.swift
//  navigation
//
//  Created by Shalu Garikapaty on 3/12/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack {
            
            WelcomeText()
            UserImage()
            TextField("Username", text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
            SecureField("Password", text: $password)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
           Button(action: {print("Button tapped")}) {
               LoginButton()
            }
         
        }.padding()
           
            }
}
        
struct WelcomeText:View {
var body: some View{
                         Text("My Period")
                         .font(.largeTitle)
                         .fontWeight(.semibold)
                         .padding(.bottom, 10)
                         
                     }
                 }
       
struct UserImage: View {
    var body: some View {
            Image("blood")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 15)
        }
    }


struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
                       .font(.headline)
                       .foregroundColor(.white)
                       .padding()
                       .frame(width: 220, height: 60)
                       .background(Color.green)
                       .cornerRadius(15.0)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
