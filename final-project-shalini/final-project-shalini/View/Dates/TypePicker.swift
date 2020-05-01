//
//  TypePicker.swift
//  PeriodDatePicker
//
//  Created by Shalu Garikapaty on 4/22/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct TypePicker: View {
//   @ObservedObject var period : Period
//   @State var date = Date()
    @State var selection = String()
//   @State private var quantity = 0
    var body: some View {
       NavigationView {
           Form {
            
            Section {
//            DatePicker(selection: $date, label: { Text("Due Date") })
               Picker(selection: $selection, label:
                   Text("Date Type")
                   , content: {
                    Text("start date" ).tag(0)
                    Text("end Date ").tag(1)
               })

               
               }
           }
       }
    }
}

struct TypePicker_Previews: PreviewProvider {
    static var previews: some View {
        TypePicker()
    }
}
