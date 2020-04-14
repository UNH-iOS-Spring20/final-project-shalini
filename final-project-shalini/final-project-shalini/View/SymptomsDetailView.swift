//
//  SymptomsDetailView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 4/13/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import FirebaseFirestore

let db = Firestore.firestore()

struct SymptomsDetailView: View {
    var body: some View {
        VStack {
            Button(action: {
                createSymptom()
            }) {
                Text("Create Symptom")
                    .font(.largeTitle)
            }
            .padding(10.0)
            
//            Button(action: {
//                updateSymptom()
//            }) {
//                Text("Update symptom")
//                    .font(.largeTitle)
//            }
//            .padding(10.0)
            
//            Button(action: {
//                deleteCollection(collection: "symptoms")
//            }) {
//                Text("Delete All Symptoms")
//                    .font(.largeTitle)
//            }
//            .padding(10.0)
            
            Button(action: {
                getCollection(collection: "symptoms")
            }) {
                Text("Get All symptoms")
                    .font(.largeTitle)
            }
            .padding(10.0)
        }
    }
}

private func createSymptom() {
    let symptomRef = db.collection("symptoms")
    
    symptomRef.document().setData([
        "name": "Cramps",
//        "scale": "Westerly",
        "image": "1"
    ])
    
    symptomRef.document().setData([
        "name": "Headache",
        "image": "2"
    ])

    symptomRef.document().setData([
           "name": "Achy",
//           "scale": "Groton",
           "image": "3"
    ])

    symptomRef.document().setData([
        "name": "Acne",
//        "scale": "Groton",
        "image": "4"
    ])
    
    symptomRef.document().setData([
            "name": "Diarrhea",
    //        "scale": "Groton",
            "image": "4"
        ])
    symptomRef.document().setData([
            "name": "Breast Tenderness",
    //        "scale": "Groton",
            "image": "5"
        ])
    symptomRef.document().setData([
            "name": "Constipation",
    //        "scale": "Groton",
            "image": "5"
        ])
    symptomRef.document().setData([
            "name": "Gas",
    //        "scale": "Groton",
            "image": "6"
        ])
}

//private func updateSymptom() {
//    let symptomRef = db.collection("symptoms")
//
//    symptomRef.document().setData([
//        "name": "Vetrano's",
////        "scale": "Charlestown",
//        "image": "RI"
//    ])
//
//    symptomRef.document().setData([
//        "name": "New Midway Pizza",
////        "scale": "New London",
//        "image": "CT"
//    ])
//}

private func getCollection(collection: String) {
    db.collection(collection).getDocuments() { (querySnapshot, err) in
        if let err = err {
            print("Error getting documents: \(err)")
        } else {
            for document in querySnapshot!.documents {
                print("\(document.documentID) => \(document.data())")
            }
        }
    }
}

//private func deleteCollection(collection: String) {
//    db.collection(collection).getDocuments() { (querySnapshot, err) in
//        if let err = err {
//            print("Error getting documents: \(err)")
//            return
//        }
//
//        for document in querySnapshot!.documents {
//            print("Deleting \(document.documentID) => \(document.data())")
//            document.reference.delete()
//        }
//    }
//}

struct SymptomsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomsDetailView()
    }
}
