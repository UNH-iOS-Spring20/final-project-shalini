//
//  CircleTab.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 4/2/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct CircleTab: View {
var body: some View {
    TabView {
       RedView()
         .tabItem {
            Image(systemName: "house.fill")
            Text("Home")
       }
        
        WhiteView()
          .tabItem {
             Image(systemName: "calendar")
             Text("Calendar")
        }

        
        
       BlueView()
         .tabItem {
            Image(systemName: "bell.fill")
            Text("reminders")
      }
        GreenView()
                .tabItem {
                   Image(systemName: "message.fill")
                   Text("Chat")
              }
        
        GreyView()
                .tabItem {
                   Image(systemName: "person.crop.circle")
                   Text("Account")
              }
    }

    }
}

struct CircleTab_Previews: PreviewProvider {
    static var previews: some View {
        CircleTab()
    }
}

struct RedView: View {
    var body: some View {
        CalendarLogIt()
    }
}
struct BlueView: View {
    var body: some View {
        Color.blue
    }
}


struct GreenView: View {
    var body: some View {
        Color.green
    }
}
struct GreyView: View {
    var body: some View {
        Color.green
    }
}

struct WhiteView: View {
    var body: some View {
        Color.green
    }
}

