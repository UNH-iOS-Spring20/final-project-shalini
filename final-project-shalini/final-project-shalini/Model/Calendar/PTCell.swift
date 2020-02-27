//
//  PTCell.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 2/27/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct PTCell: View {
    var ptDate: PTDate
    var cellWidth:CGFloat
    var body: some View {
        Text(ptDate.getText())
            .fontWeight(ptDate.getFontWeight())
            .foregroundColor(ptDate.getTextColor())
            .font(.system(size: 30))
            .background(ptDate.getBackgroundColor())
        .cornerRadius(cellWidth/2)
        
    }
}

struct PTCell_Previews: PreviewProvider {
    static var previews: some View {
        PTCell(ptDate: <#PTDate#>, cellWidth: <#CGFloat#>)
    }
}
