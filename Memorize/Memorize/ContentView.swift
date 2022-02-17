//
//  ContentView.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards, content : { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    })
                }
//                Spacer()
//                HStack {
//                    remove
//                    Spacer()
//                    add
//                }
//                .font(.largeTitle)
//                .padding(.horizontal)
            }
            .padding(.horizontal)
            .foregroundColor(.red)
            Spacer()
            HStack {
                Spacer()
                ThemeButton(name: "car", labelText: "Theme 1")
                Spacer()
                ThemeButton(name: "globe.asia.australia", labelText: "Theme 2")
                Spacer()
                ThemeButton(name: "person", labelText: "Theme 3")
                Spacer()
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
    }
    
//    var remove: some View {
//        Button {
//            if emojiCount > 1 {
//                emojiCount -= 1
//            }
//        } label: {
//            Image(systemName: "minus.circle")
//        }
//    }
//    
//    var add: some View {
//        Button {
//            if emojiCount < emojis.count {
//                emojiCount += 1
//            }
//        } label: {
//            Image(systemName: "plus.circle")
//        }
//    }
}

struct ThemeButton: View {
    var name: String
    var labelText: String
    
    var body: some View {
        Button {
            print(name)
        } label: {
            VStack {
            Image(systemName: name)
            Text(labelText)
                    .font(.footnote)
            }
        }
    }
}


struct CardView: View {
    let card: MemeoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
