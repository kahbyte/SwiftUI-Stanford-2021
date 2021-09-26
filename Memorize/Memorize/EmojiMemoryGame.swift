//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kauê Sales on 16/07/21.
//

import SwiftUI

//VIEWMODEL
class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis: [String] = ["🛬","🚓","🚂","🚒", "🚀", "🏎", "🚔", "🥺", "😎", "👨🏽‍💻", "🧠", "🍪", "😆", "😉","😞", "🤯", "🤕","👹"]
    
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


