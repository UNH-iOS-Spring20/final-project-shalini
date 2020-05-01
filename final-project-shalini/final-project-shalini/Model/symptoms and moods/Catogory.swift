//
//  CatogoryType.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 4/30/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct Catogory: Decodable, Identifiable {
   public var id: String
    public var name: String
   public var imageName:String
    enum CodingKeys: String,CodingKey{
        case id = "id"
        case name = "name"
        case imageName = "imageName"
    }
}




