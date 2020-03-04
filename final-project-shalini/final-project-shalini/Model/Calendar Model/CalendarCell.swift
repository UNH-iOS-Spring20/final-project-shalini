//
//  CalendarCell.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

import SwiftUI

struct CalendarCell: View {
    
    var calDate: CalendarDate
    
    var cellWidth: CGFloat
    
    var body: some View {
        Text(calDate.getText())
            .fontWeight(calDate.getFontWeight())
            .foregroundColor(calDate.getTextColor())
            .frame(width: cellWidth, height: cellWidth)
            .font(.system(size: 20))
            .background(calDate.getBackgroundColor())
            .cornerRadius(cellWidth/2)
    }
}

#if DEBUG
struct CalendarCell_Previews : PreviewProvider {
    static var previews: some View {
        Group {
           CalendarCell(calDate: CalendarDate(date: Date(), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate:Date().addingTimeInterval(60*60*24*365), mode: 0),
                                              //isDisabled: false,
                                              isToday: false, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(32))
           .previewDisplayName("Control")
            
//            CalendarCell(calDate: CalendarDate(date: Date(), CalendarManager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), isDisabled: true, isToday: false, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(32))
//                .previewDisplayName("Disabled Date")
            
            CalendarCell(calDate: CalendarDate(date: Date(), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0), //isDisabled: false,
                                               isToday: true, isSelected: false, isBetweenStartAndEnd: false), cellWidth: CGFloat(32))
                .previewDisplayName("Today")
            
            CalendarCell(calDate: CalendarDate(date: Date(), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0),
                                               //isDisabled: false,
                isToday: false, isSelected: true, isBetweenStartAndEnd: false), cellWidth: CGFloat(32))
                .previewDisplayName("Selected Date")
            
            CalendarCell(calDate: CalendarDate(date: Date(), calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0),
                                              // isDisabled: false,
                                               isToday: false, isSelected: false, isBetweenStartAndEnd: true), cellWidth: CGFloat(32))
                .previewDisplayName("Between Two Dates")
        }
        .previewLayout(.fixed(width: 300, height: 70))
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
    }
}
#endif

