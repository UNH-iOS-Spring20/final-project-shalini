//
//  SelectedView.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 5/5/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import Firebase
import FirebaseFirestore


struct SelectedView: View {
    @EnvironmentObject var selectedItems: SelectedItems
    //    @Binding var rating: Int
    var body: some View {
        
        
        ZStack{
            NavigationView {
                
                List {
                    Section {
                        ForEach(selectedItems.items) { item in
                            HStack {
                                Image(item.imageName)
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                                Text(item.name)
                                
                            //    Text("Value:\(Int(self.rating))")
                                
                            }
                        }.onDelete(perform: deleteItems)
                    }
                }.navigationBarTitle("Predictions")
                    .listStyle(GroupedListStyle())
                    .navigationBarItems(trailing: EditButton())
                
                
            }
        }.background(Color.pink.opacity(0.10))
        
    }
    
    
    
    func deleteItems(at offsets: IndexSet) {
        selectedItems.items.remove(atOffsets: offsets)
    }
    
    
    
    
}

struct SelectedView_Previews: PreviewProvider {
    static let selectedItems = SelectedItems()
    
    static var previews: some View {
        SelectedView().environmentObject(selectedItems)
    }
}
