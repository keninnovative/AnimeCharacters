//
//  Date.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import Foundation
extension Date {
    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: self)
    }
}
