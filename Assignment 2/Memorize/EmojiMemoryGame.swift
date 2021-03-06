//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by KauÃª Sales on 23/07/21.
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
    static var cards: [MemoryGame<String>.Card]!
    
    static let themes: [GameTheme] = [
        GameTheme(title: "Halloween", color: "Orange", emojis: ["ð»","ð","â ï¸","ð«","ð§ ","ð§ââï¸","ð§","ðª°","ð¸","ð¦´","ð"]),
        GameTheme(title: "Vehicles", color: "Red", emojis:  ["ð¬","ð","ð","ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð", "ð²"]),
        GameTheme(title: "Food", color: "Green", emojis: ["ð","ð","ð¥","ð","ð","ð","ð¥¯","ð®","ð¥ª","ð","ð«","ð","ð¥"]),
        GameTheme(title: "Emotions", color: "Yellow", emojis: ["ð","ð","ð","ð","ð«","ð¥º","ð¤","ð°","ð­","ð¡","ð¥¶","ð¥","ð¤¢","ðµâð«"]),
        GameTheme(title: "Sports", color: "Blue", emojis: ["â½ï¸","â·","ðï¸ââï¸","â¹ï¸ââï¸","ð¤¾ââï¸","ðââï¸","ð§ââï¸","ð¤¼","ð£ââï¸","ðââï¸","ð¤½ââï¸","â¹ï¸ââï¸","ðï¸ââï¸"]),
        GameTheme(title: "Animals", color: "Purple", emojis: ["ð¶","ð±","ð­","ð°","ð¹","ð¦","ð»","ð»ââï¸","ð¨","ð¯","ð·","ð¦"])
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

    var color: Color {
        Color(theme.color)
    }
    
    var score: Int {
        model.score
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
