//
//  ContentView.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/11/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
//import Firebase
//var uid = Auth.auth().currentUser?.uid
//let userRef = Firestore.firestore().collection("users").document(uid!)
struct ContentView: View {
    @State var index = 0
   
    var body: some View {
       
        VStack(spacing: 0){
            
             if self.index == 0{
                LoginView()
           
               
                Color.black.opacity(0.05)
            }
            else if (self.index == 1){
                
                CalendarView()
            }
            else if self.index == 2 {
                SelectionView()
            }
            else{
                SelectedView()
            }
//            ZStack{
//
//
//                if self.index == 0{
//
//                    Color.black.opacity(0.05)
//                }
               
//            }
            
            TabViewDetails(index: self.$index)
            
        }.padding(.top,50)
        .edgesIgnoringSafeArea(.top)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
       
    }
}


