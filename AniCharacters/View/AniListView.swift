//
//  AniListView.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import SwiftUI

struct AniListView: View {
    @State private var characterToSearch: String = ""
    @ObservedObject var viewModel: AniListViewModel
    var body: some View {
        NavigationView  {
            VStack {
                SearchBarView(text: $characterToSearch, onCommit: search)
                List(viewModel.animes) { anime in
                    AniRowView(anime: anime)
                }
            }
            .navigationTitle("Animes")
        }
    }
    
    private func search() {
        viewModel.search(characterToSearch)
    }
}
