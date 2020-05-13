//
//  SingUp.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/12/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import FirebaseFirestore
class SignUp: FirebaseCodable {
    var id: String
    @Published var user :String
    @Published var pass: String
   
var data: [String: Any]{
        return[
            
             "user" :  user,
             "pass" : pass
        ]
    }

    
     required init?(id: String, data: [String: Any]){
                guard let user = data["user"] as? String,
                 let pass = data["pass"] as? String
              else{
                 return nil
            }

       
           self.id = id
           self.user = user
           self.pass = pass
                     
             }
}

 

