//
//  SymptomView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 2/20/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

class SymptomView  {
    var id: String
    var symptom : String
    var rating  : Int
    //var sysmptomName: String
    
    //fileprivate var imageName: String
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case symptomName = "SymptonName"
       // case rivers = "Rivers"
    }

    
    init?( _ symptom:String, _ rating:Int) {
        if symptom.isEmpty || rating < 0 {
            return nil
        }
        
        
        self.symptom = symptom
        self.rating = rating
    }
    
}
