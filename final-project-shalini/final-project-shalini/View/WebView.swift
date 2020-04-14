//
//  WebView.swift
//  Angela_yu
//
//  Created by Shalu Garikapaty on 3/17/20.
//  Copyright © 2020 Shalini Garikapaty. All rights reserved.
//
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString : String?
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string:safeString) {
                let request = URLRequest(url:url)
                uiView.load(request)
                
                
            }
        }
    }
}
