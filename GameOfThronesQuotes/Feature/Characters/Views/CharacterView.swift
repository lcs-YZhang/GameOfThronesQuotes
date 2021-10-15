//
//  CharacterView.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import SwiftUI

struct CharacterView: View {
    
    let item: Quote
    
    var body: some View {
        VStack(alignment: .leading,
               spacing: 8) {
            
            Text(item.sentence)
                .font(.title)
                .bold()
                .padding()

            Text(makeAttributedString(title: "Name",
                                      label: item.character.name))
            Text(makeAttributedString(title: "Slug",
                                      label: item.character.slug))
            Text(makeAttributedString(title: "Name of House",
                                      label: item.character.house.name))
            Text(makeAttributedString(title: "Slug of House",
                                      label: item.character.house.slug))
            
        }
       .padding()

    }

    private func makeAttributedString(title: String, label: String) -> AttributedString {

        var string = AttributedString("\(title): \(label)")
        string.foregroundColor = .primary
        string.font = .system(size: 18, weight: .bold)

        if let range = string.range(of: label) {
            string[range].foregroundColor = .black.opacity(0.8)
            string[range].font = .system(size: 18)
            string[range].foregroundColor = .primary
        }

        return string

    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(item: Quote.dummyData.first!)
    }
}
