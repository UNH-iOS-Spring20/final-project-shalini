//
//  Catogories.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/11/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine


struct CatogorySection: Codable, Identifiable {
    
    var id: String
    var name: String
    var items: [CatogoryItem]
    
}

struct CatogoryItem:Codable,Identifiable,Equatable {
    static func == (lhs: CatogoryItem, rhs: CatogoryItem) -> Bool {
        return lhs.id == rhs.id
    }
    var id: String
    var name: String
    var imageName : String
    
   

    
    
    #if DEBUG
    
    static let example = CatogoryItem(id: "001", name:"Cramps", imageName: "cramps" )
    
    #endif


 
}
