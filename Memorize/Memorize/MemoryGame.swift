//
//  MemoryGame.swift
//  Memorize
//
//  Created by Young Soo Hwang on 2022/02/16.
//

import Foundation
// Equatable이 있으면 ==로 비교할 수 있다.
struct MemeoryGame<CardContent> where CardContent: Equatable {
    
    // private var는 수정할 수 없지만, private(set) var의 경우 수정 가능!
    private(set) var cards: Array<Card>
    
    // Optional이기 때문에 없어도 된다. 단, 강제추출(!)시 터짐.
    private var indexOfTheOneAndOnlyFaceUpCard: Int?
    
    // self(Card), 함수의 인자를 바꿀 수 있기 위해서는 mutating이 필요하다.
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // add numberOfPairsOfCards * 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
        var id: Int

    }
}
