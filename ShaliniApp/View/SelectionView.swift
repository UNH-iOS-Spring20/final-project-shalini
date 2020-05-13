//
//  ContentView.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 4/23/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//
import SwiftUI

struct SelectionView: View {
   // @ObservedObject var favorites = Favorites()
    let catogs = Bundle.main.decode([CatogorySection].self, from: "Catogory.json")
    
    var body: some View {
   
        NavigationView {
           
          //  ScrollView {
            
            List {
                ForEach(catogs) { section in
                    Section(header: Text(section.name)) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
            .navigationBarTitle("Symptoms and moods")
            .listStyle(GroupedListStyle())
           
            
           // }
            
       // .environmentObject(favorites)
            }
            
        }
            
            
}


struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView()
    }
}

