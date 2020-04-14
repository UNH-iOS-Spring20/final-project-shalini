//
//  PostData.swift
//  Angela_yu
//
//  Created by Shalu Garikapaty on 3/17/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Foundation
struct Results: Decodable {
    let hits:[Post]
    
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
