//
//  DatePickView.swift
//  PeriodDatePicker
//
//  Created by Shalu Garikapaty on 4/21/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct DatePickView: View {
//
//    var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//
//        formatter.dateStyle = .long
//
//        return formatter
//    }
//
    @State  var selectedDate = Date()
  
    
    var dateClosedRange: ClosedRange<Date> {
    let min = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
    let max = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
    return min...max
    }

    var body: some View {
        
    NavigationView {
        Form {
            Section {
                DatePicker(
                    selection: $selectedDate,
                    in: dateClosedRange,
                    displayedComponents: .date,
                    label: { Text("Due Date") }
                )
            }
        }
    }
        
    }
      
    }

struct DatePickView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickView()
    }
}
