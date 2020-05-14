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
    let db = Firestore.firestore()
    @State var data : [Symptoms_Prediction] = []
    //    @Binding var rating: Int
    var body: some View {
        ZStack{
            NavigationView{
            VStack{
                List{
                      ForEach(self.data, id: \.self.userID){ item in
                          Text("\(item.favorites)")
                          
                    }.onDelete(perform: deleteItems)
                  }
                .onAppear{
                      self.retreiveData()
                  }
                }.navigationBarTitle("Predictions")
                  .listStyle(GroupedListStyle())
                .navigationBarItems(trailing: EditButton())
            }
        }
      
        
   }
    
    
    
    func deleteItems(at offsets: IndexSet) {
        data.remove(atOffsets: offsets)
    }
    
    func retreiveData(){
        self.db.collectionGroup("favorites").getDocuments { (querySnapshot, err) in
            if let err = err{
                print("Error getting documents \(err)")
            }else{
                for document in querySnapshot!.documents{
                   
                    let favorites = document.get("favorites") as! String
                    let userID = document.documentID
                    self.data.append(Symptoms_Prediction(favorites: favorites,UserID: userID))
                    
                }
            }
        }
        
    }
    
    
}

struct SelectedView_Previews: PreviewProvider {
    static let selectedItems = SelectedItems()
    
    static var previews: some View {
        SelectedView().environmentObject(selectedItems)
    }
}
