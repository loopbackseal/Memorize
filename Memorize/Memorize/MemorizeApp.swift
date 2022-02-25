//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/11.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
