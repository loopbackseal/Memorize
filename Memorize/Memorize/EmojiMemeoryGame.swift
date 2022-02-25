//
//  EmojiMemeoryGame.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/16.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    typealias Card = MemeoryGame<String>.Card
    
    private static let emojis: Array<String> = ["🚙", "🚒", "🚀", "🛰", "🚌", "🚓", "🛸", "🚁", "🛶"]
//    static var status: Int = 0
        
    private static func createMemoryGame() -> MemeoryGame<String> {
        MemeoryGame<String>(numberOfPairsOfCards: 9) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    @Published private var model: MemeoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
