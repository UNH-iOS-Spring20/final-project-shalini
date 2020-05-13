//
//  ItemDetail.swift
//  MyOwnPeriod
//
//  Created by Shalu Garikapaty on 5/4/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import Firebase


import UserNotifications
let db = Firestore.firestore()
let uid = Auth.auth().currentUser?.uid
let user = Auth.auth().currentUser
//let defaults = UserDefaults.standard
struct ItemDetail: View {
    
    @EnvironmentObject var selectedItems: SelectedItems
    @State private var showingAlert = false
    var item: CatogoryItem
    
    var body: some View {
        VStack {
           
            
            Image(item.imageName)
                .padding(4)
                .background(Color.black)
                .offset(x: -5, y: -5)
                .padding()
            Text(item.name)
                .foregroundColor(Color.black)
        
            Button(action : {
                self.selectedItems.add(item: self.item)
               // defaults.set(self.item,forKey:"Add to favorites")
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .badge, .sound]) {(status, _) in
                    if status {
                        let content = UNMutableNotificationContent()
                        content.title = "Flow"
                        content.body = "Changes made in symptoms and moods"
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,  repeats: false)
                        let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                        return
                    }
                    self.showingAlert.toggle()
                }
                //self.Severity()
                let dictionary = ["UserID":uid!,"userEmail":user?.email as Any,"favorites": self.item.name,"date":Date(),"rating":"0"] as [String : Any]
                //let values = [uid: dictionary]
//                db.collection("fav").document(uid!).setData(dictionary,merge: false)
                db.collection("favorites").addDocument(data:dictionary ){
                    (err) in
                    if err != nil {
                        print((err?.localizedDescription)!)
                        return
                    }
                    print("Added")
                }
                self.showingAlert = true
            }){
                Text("Add to Favorites")
                
            }.font(.headline)
            
            //  Image(systemName: "heart.fill")
            
        }.navigationBarTitle(Text(item.name), displayMode: .inline)
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("My Own Period"), message: Text("Added to favorites"), dismissButton: .default(Text("ok")))}
        
    }

    
}
/*
 func createFavorites(){
 for item in selectedItems.items{
 db.collection("favorites").document(uid!).setData(["Favorites": item.name]) { (err) in
 
 if err != nil{
 
 print((err?.localizedDescription)!)
 return
 }
 
 print("Added")
 }
 }
 
 }
 
 
 */

//    func send() {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { (_ , _ ) in
//        }
//        let content = UNMutableNotificationContent()
//        content.title = "Period"
//        content.body = "added to favorites"
//
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
//        let req = UNNotificationRequest(identifier: "req", content: content, trigger: trigger)
//
//        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
//








struct ItemDetail_Previews: PreviewProvider {
    static let selectedItems = SelectedItems()
    static var previews: some View {
        NavigationView {
            ItemDetail(item: CatogoryItem.example).environmentObject(selectedItems)
        }
    }
}
