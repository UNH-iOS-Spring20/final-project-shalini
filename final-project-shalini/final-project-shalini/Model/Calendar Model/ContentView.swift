//
//  ContentView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 2/20/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
  
    @State var startIsPresented = false
   
    
    var calManager1 = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    var calManager2 = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 1) // automatically goes to mode=2 after start selection, and vice versa.
    
    var calManager3 = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 3)
    
    var calManager4 = CalendarManager(calendar: Calendar.current, minimumDate: Date(), maximumDate: Date().addingTimeInterval(60*60*24*365), mode: 0)
    
    
    var body: some View {
        
        VStack {
//            ImageViewer()
//            offset(y: -13)
//            .padding(.bottom, -13)
                       
            
            Text("My Period.")
                .font(.largeTitle)
            
            
           
            
            Button(action: { self.startIsPresented.toggle() }) {
                VStack {
                    Text("Log my Period").foregroundColor(.pink).multilineTextAlignment(.leading).background(/*@START_MENU_TOKEN@*/Color.blue
                        .background(/*@START_MENU_TOKEN@*/Color.gray
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .clipped()/*@END_MENU_TOKEN@*/)/*@END_MENU_TOKEN@*/)
                    SymptomView()
                        .background(/*@START_MENU_TOKEN@*/Color.blue
                            .background(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)/*@END_MENU_TOKEN@*/)
//                    Text("(end date > start date)").foregroundColor(.blue)
                    
                }.font(.title)
            }
            .sheet(isPresented: self.$startIsPresented, content: {
                CalendarVC(isPresented: self.$startIsPresented, calmanager: self.calManager2)})
            VStack {
                Text(self.getTextFromDate(date: self.calManager2.startDate))
                Text(self.getTextFromDate(date: self.calManager2.endDate))
            }
            

            
        }.onAppear(perform: startUp)
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func datesView(dates: [Date]) -> some View {
        ScrollView (.horizontal) {
            HStack {
                ForEach(dates, id: \.self) { date in
                    Text(self.getTextFromDate(date: date))
                }
            }
        }.padding(.horizontal, 15)
    }
 
    func startUp() {
        
        // example of pre-setting selected dates
        let testOnDates = [Date().addingTimeInterval(60*60*24), Date().addingTimeInterval(60*60*24*2)]
        calManager3.selectedDates.append(contentsOf: testOnDates)
        
        // example of some foreground colors
        calManager3.colors.weekdayHeaderColor = Color.blue
        calManager3.colors.monthHeaderColor = Color.green
        calManager3.colors.textColor = Color.blue
        calManager3.colors.disabledColor = Color.red
        
        // example of pre-setting disabled dates
        let testOffDates = [
            Date().addingTimeInterval(60*60*24*4),
            Date().addingTimeInterval(60*60*24*5),
            Date().addingTimeInterval(60*60*24*7)]
        calManager4.disabledDates.append(contentsOf: testOffDates)
    }
    
    func getTextFromDate(date: Date!) -> String {
        let formatter = DateFormatter()
        formatter.locale = .current
        formatter.dateFormat = "EEEE, MMMM d, yyyy"
        return date == nil ? "" : formatter.string(from: date)
    }

}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif


   
