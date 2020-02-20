//
//  SymptomView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 2/20/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

class SymptomView  {
    var symptom : String
    var rating  : Int
    
    init?( _ symptom:String, _ rating:Int) {
        if symptom.isEmpty || rating < 0 {
            return nil
        }
        
        self.symptom = symptom
        self.rating = rating
    }
    
}
