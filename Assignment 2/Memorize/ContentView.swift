//
//  ContentView.swift
//  Memorize
//
//  Created by Kauê Sales on 05/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    @State var cardsCount = Int.random(in: 4...10)
    
    var body: some View {
        
        VStack{
            Text(viewModel.title).font(.title)
            Text("Score: \(viewModel.score)").font(.title2)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: bestCardWidth()))]) {
                                        
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }.foregroundColor(viewModel.color)
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
            Button("New Game", action: {
                viewModel.newTheme()
            })
        }
        .padding(.horizontal)
    }
    
    func bestCardWidth() -> CGFloat {
        var numberOfCards: Int = 4
        
        if cardsCount <= 4 {
            numberOfCards = 2
        } else if cardsCount <= 8 {
            numberOfCards = 3
        } else {
            numberOfCards = 4
        }
        
        return CGFloat((65/numberOfCards)*4)
    
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        
    }
}
