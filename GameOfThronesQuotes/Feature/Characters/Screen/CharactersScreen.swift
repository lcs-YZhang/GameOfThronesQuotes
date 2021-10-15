//
//  CharactersScreen.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import SwiftUI

struct CharactersScreen: View {

    @StateObject private var vm = CharactersViewModelImpl(service: CharacterServiceImpl())

    var body: some View {
        
        Group {
            if vm.quote.isEmpty {
                Loading(text: "Fetching Quote")
            } else {
                List {
                    ForEach(vm.quote, id: \.sentence) { item in
                        CharacterView(item: item)
                    }
                }
            }
        }
        .task {
            await vm.getCharacters()
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
