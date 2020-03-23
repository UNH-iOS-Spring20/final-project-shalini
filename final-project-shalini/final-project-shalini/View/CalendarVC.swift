//
//  CalendarVC.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct CalendarVC: View {
    
    @Binding var isPresented: Bool
    
    @ObservedObject var calmanager: CalendarManager
    
    var body: some View {
        Group {
            CalendarWeekdayHeader(calmanager:self.calmanager)
            Divider()
            List {
                ForEach(0..<numberOfMonths()) { index in
                    CalendarMonth(isPresented: self.$isPresented, calmanager: self.calmanager, monthOffset: index)
                }
                Divider()
            }
        }
    }
    
    func numberOfMonths() -> Int {
        return calmanager.calendar.dateComponents([.month], from: calmanager.minimumDate, to: RKMaximumDateMonthLastDay()).month! + 1
    }
    
    func RKMaximumDateMonthLastDay() -> Date {
        var components = calmanager.calendar.dateComponents([.year, .month, .day], from: calmanager.maximumDate)
        components.month! += 1
        components.day = 0
        
        return calmanager.calendar.date(from: components)!
    }
}

#if DEBUG
struct CalendarVC_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            CalendarVC(isPresented: .constant(false), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0))
            CalendarVC(isPresented: .constant(false), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*32), mode: 0))
                .environment(\.colorScheme, .dark)
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
#endif

    
