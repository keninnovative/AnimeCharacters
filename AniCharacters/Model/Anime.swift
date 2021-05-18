//
//  Anime.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import Foundation

struct Anime: Codable,Identifiable {
    let id = UUID()
    let title: String
    let synopsis: String
    let type: String
    let rated: String?
    let score: Double
    let members: Double
    let imageUrl: String
    let pageLinkUrl: String?
    let startDate: Date?
    
    enum CodingKeys: String, CodingKey {
        case title
        case synopsis
        case type
        case rated
        case score
        case members
        case imageUrl = "image_url"
        case pageLinkUrl = "url"
        case startDate = "start_date"
    }
}

struct Animes: Codable {
    var results: [Anime]
}
