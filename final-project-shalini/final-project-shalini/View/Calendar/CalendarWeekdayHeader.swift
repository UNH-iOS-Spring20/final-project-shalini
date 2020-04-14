//
//  CalendarWeekdayHeader.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/1/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct CalendarWeekdayHeader : View {
    
    var calmanager: CalendarManager
    
     
    var body: some View {
        HStack {
        VStack(alignment: .center){
           Text("Calendar")
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding()
            
            Spacer()
        }
//        Spacer()
        
        HStack(alignment: .center) {
            
            ForEach(self.getWeekdayHeaders(calendar: self.calmanager.calendar), id: \.self) { weekday in
                Text(weekday)
                    .font(.system(size: 20))
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(self.calmanager.colors.weekdayHeaderColor)
            }
        }.background(calmanager.colors.weekdayHeaderBackColor)
    }
    }
    
    func getWeekdayHeaders(calendar: Calendar) -> [String] {
        
        let formatter = DateFormatter()
        
        var weekdaySymbols = formatter.shortStandaloneWeekdaySymbols
        let weekdaySymbolsCount = weekdaySymbols?.count ?? 0
        
        for _ in 0 ..< (1 - calendar.firstWeekday + weekdaySymbolsCount){
            let lastObject = weekdaySymbols?.last
            weekdaySymbols?.removeLast()
            weekdaySymbols?.insert(lastObject!, at: 0)
        }
        
        return weekdaySymbols ?? []
    }
}


#if DEBUG
struct CalendarWeekdayHeader_Previews : PreviewProvider {
    static var previews: some View {
        CalendarWeekdayHeader(calmanager: CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0))
    }
}
#endif


//struct Headings_name:View {
//     @Binding var sheetView: Bool
//var body: some View{
//
//    NavigationView {
//               Text("Log in my period")
//               .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
//                   .navigationBarItems(trailing: Button(action: {
//                       print("Dismissing sheet view...")
//                    self.sheetView = false
//                   }) {
//                       Text("Done").bold()
//                   })
//
//                     }
//                 }
//}
