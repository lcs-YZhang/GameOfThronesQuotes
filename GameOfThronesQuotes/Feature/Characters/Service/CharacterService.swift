//
//  CharacterService.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import Foundation

protocol CharacterService {
    func fetchCharacters() async throws -> Quote
}

final class CharacterServiceImpl: CharacterService {
    
    final func fetchCharacters() async throws -> Quote {
        
        let urlSession = URLSession.shared

        let url = URL(string: APIConstants.baseUrl.appending("/v1/random"))

        let (data, _) = try await urlSession.data(from: url!)

        return try JSONDecoder().decode(Quote.self, from: data)
        
    }
    
}
