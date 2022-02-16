//
//  ContentView.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/11.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = ["🚙", "🚒", "🚀", "🛰", "🚌", "🚓", "🛸", "🚁", "🛶"]
    var theme2Emojis: Array<String> = ["🏴‍☠️"]
    
    @State var emojiCount = 9
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self, content : { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
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
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
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
    var content: String
    
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.stroke(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//        ContentView()
//            .preferredColorScheme(.light)
    }
}
