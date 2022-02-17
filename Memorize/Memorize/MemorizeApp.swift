//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/11.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
