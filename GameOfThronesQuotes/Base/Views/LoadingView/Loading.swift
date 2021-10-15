//
//  Loading.swift
//  GameOfThronesQuotes
//
//  Created by Steven Zhang on 2021-10-13.
//

import SwiftUI

struct Loading: View {
        
        let text: String
        
        var body: some View {
            VStack(spacing: 8) {
                ProgressView()
                Text(text)
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loading(text: "Fetching Quote")
    }
}
