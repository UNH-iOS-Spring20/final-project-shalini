//
//  PTDate.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 2/27/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct PTDate {
    let  ptCalendar: PTCalendar  //MARK:- period tracker caledar
    var date: Date
    var isDisabled: Bool = false
    var isToday: Bool = false
    var isSelected: Bool = false
    var isBetweenStartAndEnd: Bool = false
    
    
    init (date: Date, ptCalendar: PTCalendar, isDisabled: Bool, isToday: Bool, isSelected: Bool, isBetweenStartAndEnd: Bool) {
    self.date = date
    self.ptCalendar = ptCalendar
    self.isDisabled = isDisabled
    self.isToday = isToday
    self.isSelected = isSelected
    self.isBetweenStartAndEnd = isBetweenStartAndEnd
    }
    
    func getText() -> String {
    let day = formatDate(date: date, calendar: self.ptCalendar.calendar)
    return day
    }
        
        func getTextColor() -> Color {
        var textColor = ptCalendar.colors.textColor
        if isDisabled {
            textColor = ptCalendar.colors.disabledColor
        } else if isSelected {
            textColor = ptCalendar.colors.selectedColor
        } else if isToday {
            textColor = ptCalendar.colors.todayColor
        } else if isBetweenStartAndEnd {
            textColor = ptCalendar.colors.betweenStartAndEndColor
        }
        return textColor
        }
        
        func getBackgroundColor() -> Color {
           var  backgroundColor = ptCalendar.colors.textBackColor
            
            if isBetweenStartAndEnd {
        backgroundColor = ptCalendar.colors.betweenStartandEndBackColor
            }
        
        if isToday {
        backgroundColor = ptCalendar.colors.todayBackColor
            }
        if isDisabled{
        backgroundColor = ptCalendar.colors.disabledBackColor
        }
        
        if isSelected {
        backgroundColor = ptCalendar.colors.isSelectedBackColor
        }
        return backgroundColor
            }
    //MARK:- To show the difference between selected date,diabled and range of dates between start and end.
        
        func getFontWeight() -> Font.Weight {
            var fontWeight = Font.Weight.medium
            if isDisabled {
                fontWeight = Font.Weight.thin
            } else if isSelected {
                fontWeight = Font.Weight.heavy
            } else if isToday {
                fontWeight = Font.Weight.heavy
            } else if isBetweenStartAndEnd {
                fontWeight = Font.Weight.heavy
            }
            return fontWeight
        }
        
        
        //MARK:- Date formats
            
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

        

