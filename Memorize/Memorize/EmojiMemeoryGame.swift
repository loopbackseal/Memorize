//
//  EmojiMemeoryGame.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/16.
//

import SwiftUI



class EmojiMemoryGame {

    static let emojis: Array<String> = ["🚙", "🚒", "🚀", "🛰", "🚌", "🚓", "🛸", "🚁", "🛶"]
    static var status: Int = 0
        
    static func createMemoryGame() -> MemeoryGame<String> {
        MemeoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    private var model: MemeoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemeoryGame<String>.Card> {
        return model.cards
    }
}
