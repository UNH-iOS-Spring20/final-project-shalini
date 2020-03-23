//
//  CalendarMonth.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
struct CalendarMonth: View {

    @Binding var isPresented: Bool
    
    @ObservedObject var calmanager: CalendarManager
    
    let monthOffset: Int
    
    let calendarUnitYMD = Set<Calendar.Component>([.year, .month, .day])
    let daysPerWeek = 7
    var monthsArray: [[Date]] {
        monthArray()
    }
    let cellWidth = CGFloat(32)
    
    @State var showTime = false
    
    
   var body: some View {
          VStack(alignment: HorizontalAlignment.center, spacing: 10){
              Text(getMonthHeader()).foregroundColor(self.calmanager.colors.monthHeaderColor)
              VStack(alignment: .leading, spacing: 5) {
                  ForEach(monthsArray, id:  \.self) { row in
                      HStack() {
                          ForEach(row, id:  \.self) { column in
                              HStack() {
                                  Spacer()
                                  if self.isThisMonth(date: column) {
                                      CalendarCell(calDate: CalendarDate(
                                          date: column,
                                          calmanager: self.calmanager,
//                                          isDisabled: !self.isEnabled(date: column),
                                          isToday: self.isToday(date: column),
                                          isSelected: self.isSpecialDate(date: column),
                                          isBetweenStartAndEnd: self.isBetweenStartAndEnd(date: column)),
                                          cellWidth: self.cellWidth)
                                          .onTapGesture { self.dateTapped(date: column) }
                                  } else {
                                      Text("").frame(width: self.cellWidth, height: self.cellWidth)
                                  }
                                  Spacer()
                              }
                          }
                      }
                  }
              }.frame(minWidth: 0, maxWidth: .infinity)
          }.background(calmanager.colors.monthBackColor)
      }


     func isThisMonth(date: Date) -> Bool {
         return self.calmanager.calendar.isDate(date, equalTo: firstOfMonthForOffset(), toGranularity: .month)
     }
    
    func dateTapped(date: Date) {
        if self.isEnabled(date: date) {
            switch self.calmanager.mode {
            case 0:
                if self.calmanager.selectedDate != nil &&
                    self.calmanager.calendar.isDate(self.calmanager.selectedDate, inSameDayAs: date) {
                    self.calmanager.selectedDate = nil
                } else {
                    self.calmanager.selectedDate = date
                }
                self.isPresented = false
            case 1:
                self.calmanager.startDate = date
                self.calmanager.endDate = nil
                self.calmanager.mode = 2
            case 2:
                self.calmanager.endDate = date
                if self.isStartDateAfterEndDate() {
                    self.calmanager.endDate = nil
                    self.calmanager.startDate = nil
                }
                self.calmanager.mode = 1
                self.isPresented = false
            case 3:
                if self.calmanager.selectedDatesContains(date: date) {
                    if let ndx = self.calmanager.selectedDatesFindIndex(date: date) {
                        calmanager.selectedDates.remove(at: ndx)
                    }
                } else {
                    self.calmanager.selectedDates.append(date)
                }
            default:
                self.calmanager.selectedDate = date
                self.isPresented = false
            }
        }
    }
     
    func monthArray() -> [[Date]] {
        var rowArray = [[Date]]()
        for row in 0 ..< (numberOfDays(offset: monthOffset) / 7) {
            var columnArray = [Date]()
            for column in 0 ... 6 {
                let abc = self.getDateAtIndex(index: (row * 7) + column)
                columnArray.append(abc)
            }
            rowArray.append(columnArray)
        }
        return rowArray
    }
    
    func getMonthHeader() -> String {
        let headerDateFormatter = DateFormatter()
        headerDateFormatter.calendar = calmanager.calendar
        headerDateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy LLLL", options: 0, locale: calmanager.calendar.locale)
        
        return headerDateFormatter.string(from: firstOfMonthForOffset()).uppercased()
    }
    
    func getDateAtIndex(index: Int) -> Date {
        let firstOfMonth = firstOfMonthForOffset()
        let weekday = calmanager.calendar.component(.weekday, from: firstOfMonth)
        var startOffset = weekday - calmanager.calendar.firstWeekday
        startOffset += startOffset >= 0 ? 0 : daysPerWeek
        var dateComponents = DateComponents()
        dateComponents.day = index - startOffset
        
        return calmanager.calendar.date(byAdding: dateComponents, to: firstOfMonth)!
    }
    
    func numberOfDays(offset : Int) -> Int {
        let firstOfMonth = firstOfMonthForOffset()
        let rangeOfWeeks = calmanager.calendar.range(of: .weekOfMonth, in: .month, for: firstOfMonth)
        
        return (rangeOfWeeks?.count)! * daysPerWeek
    }
    
    func firstOfMonthForOffset() -> Date {
        var offset = DateComponents()
        offset.month = monthOffset
        
        return calmanager.calendar.date(byAdding: offset, to: RKFirstDateMonth())!
    }
    
    func RKFormatDate(date: Date) -> Date {
        let components = calmanager.calendar.dateComponents(calendarUnitYMD, from: date)
        
        return calmanager.calendar.date(from: components)!
    }
    
    func RKFormatAndCompareDate(date: Date, referenceDate: Date) -> Bool {
        let refDate = RKFormatDate(date: referenceDate)
        let clampedDate = RKFormatDate(date: date)
        return refDate == clampedDate
    }
    
    func RKFirstDateMonth() -> Date {
        var components = calmanager.calendar.dateComponents(calendarUnitYMD, from: calmanager.minimumDate)
        components.day = 1
        
        return calmanager.calendar.date(from: components)!
    }
    
    // MARK: - Date Property Checkers
    
    func isToday(date: Date) -> Bool {
        return RKFormatAndCompareDate(date: date, referenceDate: Date())
    }
     
    func isSpecialDate(date: Date) -> Bool {
        return isSelectedDate(date: date) ||
            isStartDate(date: date) ||
            isEndDate(date: date) ||
            isOneOfSelectedDates(date: date)
    }
    
    func isOneOfSelectedDates(date: Date) -> Bool {
        return self.calmanager.selectedDatesContains(date: date)
    }

    func isSelectedDate(date: Date) -> Bool {
        if calmanager.selectedDate == nil {
            return false
        }
        return RKFormatAndCompareDate(date: date, referenceDate: calmanager.selectedDate)
    }
    
    func isStartDate(date: Date) -> Bool {
        if calmanager.startDate == nil {
            return false
        }
        return RKFormatAndCompareDate(date: date, referenceDate: calmanager.startDate)
    }
    
    func isEndDate(date: Date) -> Bool {
        if calmanager.endDate == nil {
            return false
        }
        return RKFormatAndCompareDate(date: date, referenceDate: calmanager.endDate)
    }
    
    func isBetweenStartAndEnd(date: Date) -> Bool {
        if calmanager.startDate == nil {
            return false
        } else if calmanager.endDate == nil {
            return false
        } else if calmanager.calendar.compare(date, to: calmanager.startDate, toGranularity: .day) == .orderedAscending {
            return false
        } else if calmanager.calendar.compare(date, to: calmanager.endDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }
    
//    func isOneOfDisabledDates(date: Date) -> Bool {
//        return self.$calmanager.disabledDatesContains(date: date)
//    }
//
    func isEnabled(date: Date) -> Bool {
        let clampedDate = RKFormatDate(date: date)
        if calmanager.calendar.compare(clampedDate, to: calmanager.minimumDate, toGranularity: .day) == .orderedAscending || calmanager.calendar.compare(clampedDate, to: calmanager.maximumDate, toGranularity: .day) == .orderedDescending {
            return false
        }
    
       return true
    }
    
    
    func isStartDateAfterEndDate() -> Bool {
        if calmanager.startDate == nil {
            return false
        } else if calmanager.endDate == nil {
            return false
        } else if calmanager.calendar.compare(calmanager.endDate, to: calmanager.startDate, toGranularity: .day) == .orderedDescending {
            return false
        }
        return true
    }
}


#if DEBUG
struct RKMonth_Previews : PreviewProvider {
    static var previews: some View {
        CalendarMonth(isPresented: .constant(false),calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), monthOffset: 0)
    }
}
    
#endif



