//
//  SymptomsView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/22/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI


struct SymptomView: View {
    var body: some View {
       
        

        let one  = Feelings(name: "Achy", image:Image("arrow") )
        let two  = Feelings(name: "Acne",image:Image("arrow"))
        let three = Feelings(name: "Bloated",image: Image("arrow"))
        let four = Feelings(name: "Cramps",image:Image("arrow"))
        let five = Feelings(name: "Constipation",image:Image("arrow"))
        let six = Feelings(name: "Dizzy",image:Image("arrow"))
        let seven = Feelings(name: "Headache",image:Image("arrow"))
        let eight = Feelings(name: "Insomnia",image:Image("arrow"))
        let nine = Feelings(name: "PMS",image:Image("arrow"))
        let feelings =  [one,two,three,four,five,six,seven,eight,nine]



        return
            NavigationView {
            List(feelings) { feelings in
                ZStack {
                    Color.pink
                HStack {
//                    Image(systemName: feelings.image)
//                        .frame(width: 50 , height: 10 , alignment:.leading)
                    FeelingsRow(feelings: feelings)
                    self.frame(width: 10, height: 10, alignment: .leading)

                }
                
                ///*@START_MENU_TOKEN@*/Color(red: 0.5, green: 0.5, blue: 0.5)/*@END_MENU_TOKEN@*/
                .font(.headline)
                    
                
                     
        }
                .navigationBarTitle("Symptoms")
                //foregroundColor(.yellow)
   }
            }
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        
    }

struct SymptomView_Previews: PreviewProvider {
    static var previews: some View {
        SymptomView()
    }
}
}
