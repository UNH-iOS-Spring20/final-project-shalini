//
//  Order.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 5/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

class fetchJsonData:  ObservableObject {
    @Published var details = [Catogory]()
    init(){
        load()
    }
    func load(){
        let url = Bundle.main.url(forResource: "Catogory", withExtension: "json")!
        URLSession.shared.dataTask(with: url) {(data,response,error) in
                do {
                               if let d = data {
                                   let decodedLists = try JSONDecoder().decode([Catogory].self, from: d)
                                   DispatchQueue.main.async {
                                       self.details = decodedLists
                                   }                               }else {
                                   print("No Data")
                               }
                           } catch {
                               print ("Error")
                           }
                           
                       }.resume()
        }
    }
