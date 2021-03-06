//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by KauÃª Sales on 16/07/21.
//

import SwiftUI

//VIEWMODEL
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["ð¬","ð","ð","ð", "ð", "ð", "ð", "ð¥º", "ð", "ð¨ð½âð»", "ð§ ", "ðª", "ð", "ð","ð", "ð¤¯", "ð¤","ð¹"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 8) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
        
    var cards: Array<Card> {
        model.cards
    }
    
    //MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
 }


