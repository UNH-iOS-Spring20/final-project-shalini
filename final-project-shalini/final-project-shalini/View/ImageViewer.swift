//
//  ImageView.swift
//  final-project-shalini
//
//  Created by Shalu Garikapaty on 3/5/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI

struct ImageViewer: View {
    var image: Image
    var body: some View {
        image
//        Image("turtlerock")
        .clipShape(Circle())
//
//            .overlay(Circle().stroke(Color.black, lineWidth:4))
//        .shadow(radius: 10)
    }
}

struct ImageViewe4r_Previews: PreviewProvider {
    static var previews: some View {
    ImageViewer(image:Image("1"))
    }
}

