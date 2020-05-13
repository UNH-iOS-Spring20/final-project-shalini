//
//  ItemRow.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 5/3/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//


import SwiftUI
import Firebase
var uid_1 = Auth.auth().currentUser?.uid
struct ItemRow: View {
    
  //  @EnvironmentObject var favorites : Favorites
    var item: CatogoryItem
    @State var rating: Int = 0
    
    var body: some View {
        
        NavigationLink(destination: ItemDetail(item: item)) {
        
        HStack {
            
            Image(item.imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                
            }.layoutPriority(1)
            
            Spacer()
            
            VStack{
                Text("Severity")
                Stepper(value: $rating, in: 0...6) {
                    
                    Text("value:\(rating)")
                }.onAppear{
                    
                     db.collection("favorites").getDocuments{ (snapshot, err) in
                                if let err = err {
                                    print("Error in getting documents:\(err)")
                                } else {
                                    for document in snapshot!.documents {
                                        let docId = document.documentID
                    //                    let  rating = document.get("rating") as! String
                                        db.collection("favorites").document(docId).setData(["rating":"\(self.rating)"], merge: true)
                                    }
                                    
                                }
                            }
                }
                
            }.padding()
            
            }.background(Color.pink.opacity(0.10))
            
        }
    }
}

    func Severity() {
       
    }
struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
            ItemRow(item:CatogoryItem.example)
//        Group {
//            ItemRow(item: Catogory[0])
//            ItemRow(item: Catogory[1])
//        }
//        .previewLayout(.fixed(width: 300, height: 70))
    }
}
