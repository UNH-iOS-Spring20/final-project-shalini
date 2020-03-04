//
//  CalendarDate.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct CalendarDate {
    var date: Date
       let calmanager: CalendarManager
       
      // var isDisabled: Bool = false
       var isToday: Bool = false
       var isSelected: Bool = false
       var isBetweenStartAndEnd: Bool = false
       
       init(date: Date, calmanager: CalendarManager, isToday: Bool, isSelected: Bool, isBetweenStartAndEnd: Bool) {
           self.date = date
           self.calmanager = calmanager
           //self.isDisabled = isDisabled
           self.isToday = isToday
           self.isSelected = isSelected
           self.isBetweenStartAndEnd = isBetweenStartAndEnd
       }
       
       func getText() -> String {
           let day = formatDate(date: date, calendar: self.calmanager.calendar)
           return day
       }
       
       func getTextColor() -> Color {
           var textColor = calmanager.colors.textColor
            if isSelected {
               textColor = calmanager.colors.selectedColor
           } else if isToday {
               textColor = calmanager.colors.todayColor
           } else if isBetweenStartAndEnd {
               textColor = calmanager.colors.betweenStartAndEndColor
           }
           return textColor
       }
       
       func getBackgroundColor() -> Color {
           var backgroundColor = calmanager.colors.textBackColor
           if isBetweenStartAndEnd {
               backgroundColor = calmanager.colors.betweenStartAndEndBackColor
           }
           if isToday {
               backgroundColor = calmanager.colors.todayBackColor
           }
           
           if isSelected {
               backgroundColor = calmanager.colors.selectedBackColor
           }
           return backgroundColor
       }
       
       func getFontWeight() -> Font.Weight {
           var fontWeight = Font.Weight.medium
           if isSelected {
               fontWeight = Font.Weight.heavy
           } else if isToday {
               fontWeight = Font.Weight.heavy
           } else if isBetweenStartAndEnd {
               fontWeight = Font.Weight.heavy
           }
           return fontWeight
       }
       
       // MARK: - Date Formats
       
       func formatDate(date: Date, calendar: Calendar) -> String {
           let formatter = dateFormatter()
           return stringFrom(date: date, formatter: formatter, calendar: calendar)
       }
       
       func dateFormatter() -> DateFormatter {
           let formatter = DateFormatter()
           formatter.locale = .current
           formatter.dateFormat = "d"
           return formatter
       }
       
       func stringFrom(date: Date, formatter: DateFormatter, calendar: Calendar) -> String {
           if formatter.calendar != calendar {
               formatter.calendar = calendar
           }
           return formatter.string(from: date)
       }
    
}
