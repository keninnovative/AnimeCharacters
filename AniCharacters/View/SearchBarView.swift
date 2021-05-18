//
//  SearchBarView.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import SwiftUI

struct SearchBarView: View {
    @State var text: Binding<String>
    var onEditingChanged: (Bool) -> Void = { _ in }
    var onCommit: () -> Void = { }
    
    var body: some View {
        TextField("Search", text: text, onEditingChanged: onEditingChanged, onCommit: onCommit)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .keyboardType(.webSearch)
            .disableAutocorrection(true)
            .autocapitalization(.none)
            .frame(height: 20)
            .padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
    }
}
