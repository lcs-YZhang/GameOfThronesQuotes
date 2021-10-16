//
//  CharacterViewModel.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import Foundation

protocol CharacterViewModel: ObservableObject {
    func getCharacters() async
}

@MainActor
final class CharactersViewModelImpl: CharacterViewModel, ObservableObject {
    
    @Published private(set) var quote: [Quote] = []
    
    private let service: CharacterService
    
    init(service: CharacterService) {
        self.service = service
    }
    
    func getCharacters() async {
        do {
            let newQuote = try await service.fetchCharacters()
//            objectWillChange.send()
            quote.append(newQuote)
        } catch {
            print(error)
        }
    }
    
}
