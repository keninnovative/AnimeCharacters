//
//  AniCharactersApp.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/6/21.
//

import SwiftUI

@main
struct AniCharactersApp: App {
    var body: some Scene {
        WindowGroup {
            AniListView(viewModel: AniListViewModel())
        }
    }
}
