//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kauê Sales on 23/07/21.
//

import SwiftUI

//protocol EmojiMemoryGameProtocol: AnyObject {
//    var cards: Array<MemoryGame<String>.Card> { get }
//    var title: String { get }
//    var color: String { get }
//
//    func choose(_ card: MemoryGame<String>.Card)
//    func newTheme()
//}

//VIEWMODEL
class EmojiMemoryGame: ObservableObject {
    static var chosenTheme: GameTheme!
    
    static let themes: [GameTheme] = [
        GameTheme(title: "Halloween", color: "Orange", emojis: ["👻","💀","☠️","🫀","🧠","🧟‍♀️","🧞","🪰","🕸","🦴","🐀"]),
        GameTheme(title: "Vehicles", color: "Red", emojis:  ["🛬","🚓","🚂","🚒", "🚀", "🏎", "🚔", "🚗", "🚕", "🚌", "🚎", "🚑", "🚐", "🚛", "🚜", "🚘", "🚖", "🚲"]),
        GameTheme(title: "Food", color: "Green", emojis: ["🍎","🍗","🥓","🍟","🍔","🍕","🥯","🌮","🥪","🍝","🫔","🍜","🍥"]),
        GameTheme(title: "Emotions", color: "Yellow", emojis: ["😀","😁","😝","😖","😫","🥺","😤","😰","😭","😡","🥶","😥","🤢","😵‍💫"]),
        GameTheme(title: "Sports", color: "Blue", emojis: ["⚽️","⛷","🏋️‍♀️","⛹️‍♀️","🤾‍♀️","🏄‍♀️","🧘‍♀️","🤼","🚣‍♀️","🏊‍♂️","🤽‍♂️","⛹️‍♂️","🏌️‍♀️"]),
        GameTheme(title: "Animals", color: "Purple", emojis: ["🐶","🐱","🐭","🐰","🐹","🦊","🐻","🐻‍❄️","🐨","🐯","🐷","🦁"])
    ]
    
    private func chooseRandomTheme() -> GameTheme? {
        return EmojiMemoryGame.themes.randomElement()
    }
    
    static func createMemoryGame() -> MemoryGame<String>? {
        guard let theme = themes.randomElement() else { return nil }
        
        chosenTheme = theme
    
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 6...theme.emojis.count)) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()!
    @Published private var theme: GameTheme = chosenTheme
}

extension EmojiMemoryGame/*: EmojiMemoryGameProtocol*/ {
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var title: String {
        theme.title
    }

    var color: String {
        theme.color
    }
    
    //MARK: - Intent(s)
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func newTheme() {
        model = EmojiMemoryGame.createMemoryGame()!
        theme = EmojiMemoryGame.chosenTheme
    }
}
