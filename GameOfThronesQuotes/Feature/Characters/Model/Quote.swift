//
//  Quote.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-11.
//

import Foundation

struct Quote: Decodable {
    let sentence: String
    let character: Character
}

struct Character: Decodable {
    let name: String
    let slug: String
    let house: House
}

struct House: Decodable {
    let name: String
    let slug: String
}

extension Quote {
    
    static let dummyData: [Quote] = [
        Quote(sentence: "Well, my brother has his sword, and I have my mind, and a mind needs books like a sword needs a whetstone.",
              character: Character(name: "Tyrion Lannister",
                                   slug: "tyrion",
                                   house: House(name: "House Lannister of Casterly Rock",
                                                slug: "lannister")
                    )
             )
      ]
}
