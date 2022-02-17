//
//  EmojiMemeoryGame.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/16.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {

    static let emojis: Array<String> = ["🚙", "🚒", "🚀", "🛰", "🚌", "🚓", "🛸", "🚁", "🛶"]
    static var status: Int = 0
        
    static func createMemoryGame() -> MemeoryGame<String> {
        MemeoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    @Published private var model: MemeoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemeoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: MemeoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
}
