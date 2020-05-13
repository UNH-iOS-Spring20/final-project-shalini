//
//  User.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/12/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//


import FirebaseFirestore

class User: FirebaseCodable{
     var id: String
   
    @Published var email: String
    @Published var password: String
    
    var data: [String: Any]{
        return[
            
             "email" :  email,
             "password" : password
        ]
    }

    
     required init?(id: String, data: [String: Any]){
                guard let email = data["email"] as? String,
                 let password = data["password"] as? String
              else{
                 return nil
            }

       
           self.id = id
           self.email = email
           self.password = password
                     
             }
}
