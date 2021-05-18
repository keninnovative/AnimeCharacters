//
//  AniRowView.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import SwiftUI

struct AniRowView: View {
    let anime: Anime
    var body: some View {
        HStack{
            ImageView(withURL: anime.imageUrl)
            VStack(alignment: .leading, spacing: 8, content: {
                Text(anime.title)
                    .font(.headline)
                Text(anime.synopsis)
                    .font(.subheadline)
                HStack(alignment: .center, spacing:6) {
                    Text("Members:")
                        .font(.caption)
                    Text(String(format: "%.f", anime.members))
                        .font(.subheadline)
                }
                HStack(alignment: .center, spacing: 6) {
                    Text("Start date:")
                        .font(.caption)
                    Text(anime.startDate?.formatted ?? "")
                        .font(.subheadline)
                }
                HStack(alignment: .center, spacing: 12) {
                    Text(anime.type)
                        .font(.subheadline)
                    Text(anime.rated ?? "")
                        .font(.subheadline)
                    Text(String(format: "⭐️ %0.2f", anime.score))
                        .font(.subheadline)
                }
                NavigationLink(destination: AniWebView(url: (URL(string: anime.pageLinkUrl ?? AnimeConstants.myAnimeListURL) ?? URL(string: AnimeConstants.myAnimeListURL))!)) {
                    Text("More Detail")
                        .foregroundColor(.blue)
                        .font(.subheadline)
                }
            })
            Spacer()
        }
    }
}
