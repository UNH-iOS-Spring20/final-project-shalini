//
//  CalendarManager.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
class CalendarManager : ObservableObject {

    @Published var calendar = Calendar.current
    @Published var minimumDate: Date = Date()
    @Published var maximumDate: Date = Date()
    @Published var disabledDates: [Date] = [Date]()
    @Published var selectedDates: [Date] = [Date]()
    @Published var selectedDate: Date! = nil
    @Published var startDate: Date! = nil
    @Published var endDate: Date! = nil
    
    @Published var mode: Int = 0
    
   var colors = CalendarColorSetting()
  
    init(calendar: Calendar, minimumDate: Date, maximumDate: Date, selectedDates: [Date] = [Date](), mode: Int) {
        self.calendar = calendar
        self.minimumDate = minimumDate
        self.maximumDate = maximumDate
        self.selectedDates = selectedDates
        self.mode = mode
    }
    
    func selectedDatesContains(date: Date) -> Bool {
        if let _ = self.selectedDates.first(where: { calendar.isDate($0, inSameDayAs: date) }) {
            return true
        }
        return false
    }
    
    func selectedDatesFindIndex(date: Date) -> Int? {
        return self.selectedDates.firstIndex(where: { calendar.isDate($0, inSameDayAs: date) })
    }
    
   
    
    
    
}

