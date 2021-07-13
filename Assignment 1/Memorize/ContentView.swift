//
//  ContentView.swift
//  Memorize
//
//  Created by Kauê Sales on 05/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: [String] = ["🛬","🚓","🚂","🚒", "🚀", "🏎", "🚔", "🚖", "🚗", "🚘", "🚕"].shuffled()
    
    @State var cardsCount = Int.random(in: 4...10)
    
    
    
    enum CardsTheme {
        case vehicles
        case emotions
        case food
    }
    
    var body: some View {
        
        VStack{
            Text("Memorize!").font(.title)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: bestCardWidth()))]) {
                    
                    ForEach(emojis[0..<cardsCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }.foregroundColor(.red)
            }
            
            Spacer()
            
            HStack {
                Spacer()
                emotions
                Spacer()
                vehicles
                Spacer()
                food
                Spacer()
            }
            
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicles: some View {
        Button(action: {
            setCards(theme: .vehicles)
        }, label: {
            VStack {
                Text("Vehicles").font(.body)
                Image(systemName: "car.circle")
            }
        })
    }
    
    var emotions: some View {
        Button(action: {
            setCards(theme: .emotions)
        }, label: {
            VStack {
                Text("Emotions").font(.body)
                Image(systemName: "face.smiling")
            }
        })
    }
    
    var food: some View {
        Button(action: {
            setCards(theme: .food)
        }, label: {
            VStack {
                Text("Food").font(.body)
                Image(systemName: "cart.circle")
            }
        })
    }
    
    
    func setCards(theme: CardsTheme) {
        switch theme {
        case .emotions:
            emojis = ["😃", "😂", "😊", "😒", "😡", "😖", "🥺", "🥰", "😢", "🙃"].shuffled()
        case .food:
            emojis = ["🍎", "🍇", "🍟", "🥩", "🍗", "🌭", "🥗", "🍓", "🍕", "🍲"].shuffled()
        case .vehicles:
            emojis = ["🛬","🚓","🚂","🚒", "🚀", "🏎", "🚔", "🚖", "🚗", "🚘", "🚕"].shuffled()
        }
        
        cardsCount = Int.random(in: 4..<emojis.count)
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
    
    @State var isFaceUp: Bool = true
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
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
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        
    }
}
