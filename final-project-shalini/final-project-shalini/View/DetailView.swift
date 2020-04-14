//
//  Detailview.swift
//  Angela_yu
//
//  Created by Shalu Garikapaty on 3/17/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//

import SwiftUI
import WebKit
struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString:url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
        //(url: "https://www.google.com")
    }
}



