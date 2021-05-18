//
//  AniListViewModel.swift
//  AniCharacters
//
//  Created by Ken Nyame on 5/7/21.
//

import SwiftUI
import Combine

class AniListViewModel: ObservableObject {
    @Published var animes = [Anime]()
        
    func search(_ character: String) {
        WebServices().getAnimesBy(character: character) { (animes, error) in
            if let error = error {
                DispatchQueue.main.async {
                    self.animes = []
                }
                print(error.localizedDescription)
            }
            else {
                guard let animes = animes else {
                    print("Empty animes")
                    DispatchQueue.main.async {
                        self.animes = []
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.animes = animes
                }
            }
        }
    
    }
    
}
