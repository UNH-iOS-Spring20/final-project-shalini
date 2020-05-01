//
//  TestDatePicker.swift
//  PeriodDatePicker
//
//  Created by Shalu Garikapaty on 4/20/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//
import SwiftUI
import UIKit

struct TestDatePicker: View {
    
    @State private var date: Date
    @State private var weekDay: String
    
    private static func weekDay(for date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let weekDay = dateFormatter.string(from: date)
        return weekDay
    }
    
    private var dateProxy:Binding<Date> {
        Binding<Date>(get: {self.date }, set: {
            self.date = $0
            self.UpdateDayFromDate()
        })
    }
    
    init() {
        self._date = State<Date>(initialValue: Date())
        self._weekDay = State<String>(initialValue: Self.weekDay(for: Date()))
    }
    
    var body: some View {
        
        Form {
            
            // Date Picker
            DatePicker(selection: dateProxy, displayedComponents: .date, label:{ Text("Start date") }
                
                
            )
            
            Text("The Weekday is :  \(weekDay)")
            
            
        }
        
    }
    
    func UpdateDayFromDate() {
        self.weekDay = Self.weekDay(for: self.date)
    }
    
    func updateDateFromWeek() {
        // To do
    }
    
    
    func getWeekDay(_ date: Date) -> String {
        ""
    }
}

struct TestDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        TestDatePicker()
    }
}
