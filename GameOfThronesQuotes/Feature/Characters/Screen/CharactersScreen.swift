//
//  CharactersScreen.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import SwiftUI

struct CharactersScreen: View {

    @StateObject private var vm = CharactersViewModelImpl(
        service: CharacterServiceImpl()
    )

    var body: some View {
        VStack(alignment: .center) {
            if vm.quote.isEmpty {
                ProgressView()
            } else {
                // Show the last XKCDComic instance in the list from the view model
                CharacterView(item: vm.quote.last!)
            }
        }
        .padding()
        .task {
            // Wait for the currentComic to be retrieved from the API
            await vm.getCharacters()
            
        }
    }
}

struct CharactersScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharactersScreen()
    }
}
