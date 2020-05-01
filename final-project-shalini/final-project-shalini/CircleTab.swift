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
//            Image(systemName: "house.fill")
            Text("1")
       }
        
        WhiteView()
          .tabItem {
//             Image(systemName: "calendar")
             Text("2")
        }

        
        
       BlueView()
         .tabItem {
//            Image(systemName: "bell.fill")
            Text("3")
      }
        GreenView()
                .tabItem {
//                   Image(systemName: "ellipses.bubble")
                   Text("4")
              }
        
        GreyView()
                .tabItem {
//                   Image(systemName: "person.crop.circle")
                   Text("5")
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
       SAndMView()
        
    }
}


struct GreenView: View {
    var body: some View {
        ContentView()
    }
}
struct GreyView: View {
    var body: some View {
        Color.red
    }
}

struct WhiteView: View {
    var body: some View {
        Color.green
    }
}

