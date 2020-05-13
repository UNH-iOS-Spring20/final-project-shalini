//
//  CalendarView.swift
//  Period_Final
//
//  Created by Shalu Garikapaty on 5/11/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import UserNotifications



struct CalendarView: View{
    @State var date = Date()
    @State var end_date = Date()
    @State var next_cycle = Date()
    @State var data: DateType!
    @State var formatter = DateFormatter()
    @State var expand = false
    @State var year = false
    @State var numberOfDays: String = ""
    @State var showingAlert = false
    var body: some View{
        ZStack{
        GeometryReader{_ in
            VStack{
                if self.data != nil {
                    ZStack{
                        VStack(spacing: 15){
                            ZStack{
                                HStack{
                                    Spacer()
                                    Text(self.data.Month)
                                    .font(.title)
                                        .foregroundColor(.white)
                                    Spacer()
                                }
                                .padding(.vertical)
                                HStack{
                                    Button(action: {
                                        
                                        self.date = Calendar.current.date(byAdding: .month,value: -1, to: self.date)!
                                       
                                        self.UpdateDate()
                                        
                                    }) {
                                        Image(systemName: "arrow.left")
                                          
                                    }
                                  Spacer()
                                    Button(action: {
                                        self.date = Calendar.current.date(byAdding: .month,value: 1, to: self.date)!
                                        
                                        self.UpdateDate()
                                    }) {
                                        Image(systemName: "arrow.right")
                                            
                                    }
                                }
                                .foregroundColor(.white)
                                .padding(.horizontal,30)
                                
                            }
                            .background(Color.red)
                            
                            Text(self.data.Date)
                                .font(.system(size:65))
                                .fontWeight(.bold)
                            Text(self.data.Day)
                                .font(.title)
                            
                            Divider()
                            
                            ZStack{
                            Text(self.data.Year)
                                .font(.title)
                          
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        withAnimation(.default){
                                        self.expand.toggle()
                                        }
                                    }) {
                                        Image(systemName: "plus")
                                            .renderingMode(.original)
                                            .resizable()
                                            .frame(width: 10,height: 16)
                                            .rotationEffect(.init(degrees: self.expand ? 270 : 90))
                                    
                                    }.padding(.trailing,30)
                                }
                            }
                            if self.expand{
                                Toggle(isOn: self.$year) {
                                    Text("Year")
                                        .font(.title)
                                        
                                }
                                .padding(.trailing,15)
                                .padding(.leading,25)
                            }
                        }      .padding(.bottom,self.expand ? 10 : 12)
                        
                        HStack{
                            Button(action: {
                                self.date = Calendar.current.date(byAdding: self.year ? .year:.day,value: -1, to: self.date)!
                              
                                self.UpdateDate()
                            }) {
                                Image(systemName: "arrow.left")
                                    .foregroundColor(.black)
                            }
                          Spacer()
                            Button(action: {
                                self.date = Calendar.current.date(byAdding: self.year ? .year:.day,value: 1, to: self.date)!
                                
                                self.UpdateDate()
                            }) {
                                Image(systemName: "arrow.right")
                                    .foregroundColor(.black)
                            }
                        }
                        .padding(.horizontal,30)
                        
                        
                    }
                    .frame(width: UIScreen.main.bounds.width/1.5 )
                    .background(Color.white)
                    .cornerRadius(15)
                    
                }
                
    
                    VStack{
                       
                         TextField("Enter Number of days Period Lasts: ", text: self.$numberOfDays)
                            .font(Font.system(.caption))
                            .padding(.all,10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.red, lineWidth: 1))
                        }
                VStack{
                            
                    Button(action: {
                                       UNUserNotificationCenter.current().requestAuthorization(options: [.alert , .badge, .sound]) {(status, _) in
                                           if status {
                                               let content = UNMutableNotificationContent()
                                               content.title = "Flow"
                                               content.body = "Your start date is noted"
                                               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5,  repeats: false)
                                               let request = UNNotificationRequest(identifier: "noti", content: content, trigger: trigger)
                                               
                                               UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
                                               return
                                           }
                                           self.showingAlert.toggle()
                                       }
                        
                        let remaining_days = 28 - Int(self.numberOfDays)!
                        self.end_date = self.date
                        self.next_cycle = Calendar.current.date(byAdding:.day,value: remaining_days, to: self.date)!
                        self.end_date = Calendar.current.date(byAdding:.day,value: Int(self.numberOfDays)!, to: self.date)!
                        self.UpdateDate()

                                  }) {
                                      if self.numberOfDays == "0" || self.numberOfDays == "" {
                                        Text("Current Date: \(self.StartDate())")
                                      }else  {
                                        Text("Go!")
                                            .fontWeight(.heavy)
                                            .font(.system(size: 30))
                                            .foregroundColor(.black)
                                   
                                    }

                    }
                    .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Start Date: \(self.StartDate())")
                            .fontWeight(.heavy)
                            .padding()
                        
                        Text("End Date: \(self.dateFormat())")
                        .fontWeight(.heavy)
                        .padding()
                        
                    
                    }
                    VStack{
                        Text("Next Predicted Cycle: \(self.nextCycle())")
                            .font(.headline)
                            .fontWeight(.heavy)
                             .padding()
                       
                    }
                    }.alert(isPresented: self.$showingAlert) {
                    Alert(title: Text("flow"), message: Text("start date predicted"), dismissButton: .default(Text("ok")))}
                
                
            }
           
            
        }
        .background(Color.black.opacity(0.06))
        .edgesIgnoringSafeArea(.all)
        
        .onTapGesture {
            self.formatter.dateFormat = "dd-MMM-YYYY"
            print(self.formatter.string(from: self.date))
        }
            
        .onAppear(){
            self.UpdateDate()
        }
       
        }.background(Color.pink.opacity(0.10))
        
    }
    
    
    func UpdateDate(){
        let current = Calendar.current
        let date =  current.component(.day, from: self.date)
        let monthNo = current.component(.month, from: self.date)
        let month = current.monthSymbols[monthNo-1]
        let year = current.component(.year, from: self.date)
        let weekno = current.component(.weekday, from: self.date)
        let day = current.weekdaySymbols[weekno - 1]
        self.data = DateType(Day: day, Date: "\(date)", Year: "\(year)", Month: month)
    }
    func StartDate()->String{
        self.formatter.dateFormat = "dd.MM.yyyy"
                  return self.formatter.string(from: self.date)
    }
    func nextCycle()->String{
        self.formatter.dateFormat = "dd.MM.yyyy"
        return self.formatter.string(from: self.next_cycle)
        UserDefaults.standard.set(self.formatter, forKey: "next_cycle")
    }
  func dateFormat() -> String {
           self.formatter.dateFormat = "dd.MM.yyyy"
           return self.formatter.string(from: self.end_date)
       }
     
}

struct DateType{
    var Day: String
    var Date: String
    var Year : String
    var Month: String
    
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
