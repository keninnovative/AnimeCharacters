//
//  AniWebView.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import SwiftUI
import WebKit

struct AniWebView: UIViewRepresentable {
    let url: URL
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
