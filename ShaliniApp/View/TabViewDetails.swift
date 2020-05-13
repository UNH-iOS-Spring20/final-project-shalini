//
//  TabViewDetails.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/11/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Foundation

import SwiftUI
struct TabViewDetails : View {
    
    @Binding var index : Int
    
    var body : some View{
        
        
        HStack{
            
            Button(action: {
                
                self.index = 0
                
            }) {
                
                VStack{
                    
                    if self.index != 0{
                        
                        Image(systemName: "house.fill").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image(systemName: "house.fill")
                            .resizable()
                            .frame(width: 25, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Home").foregroundColor(Color.black.opacity(0.7))
                    }
                }
                
                
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
                self.index = 1
                
            }) {
                
                VStack{
                    
                    if self.index != 1{
                        
                        Image(systemName: "calendar").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image(systemName: "calendar")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("Calendar").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
                self.index = 2
                
            }) {
                
                VStack{
                    
                    if self.index != 2{
                        
                        Image(systemName:"list.dash").foregroundColor(Color.black.opacity(0.2))
                    }
                    else{
                        
                        Image(systemName:"list.dash")
                            .resizable()
                            .frame(width: 24, height: 22)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(y: -20)
                            .padding(.bottom, -20)
                        
                        Text("List").foregroundColor(Color.black.opacity(0.7))
                    }
                }
            }
            
            Spacer(minLength: 15)
            
            Button(action: {
                
                self.index = 3
                
            }) {
                
               VStack{
                   
                   if self.index != 3{
                       
                       Image(systemName: "heart.fill").foregroundColor(Color.black.opacity(0.2))
                   }
                   else{
                       
                       Image(systemName: "heart.fill")
                           .resizable()
                           .frame(width: 25, height: 22)
                           .foregroundColor(.white)
                           .padding()
                           .background(Color.red)
                           .clipShape(Circle())
                           .offset(y: -20)
                           .padding(.bottom, -20)
                       
                       Text("Favorites").foregroundColor(Color.black.opacity(0.7))
                   }
               }
            }
            
        }.padding(.vertical,-10)
        .padding(.horizontal, 25)
        .background(Color.white)
        .animation(.spring())
    }
}
