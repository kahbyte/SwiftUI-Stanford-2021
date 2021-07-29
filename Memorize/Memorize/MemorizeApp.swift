//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Kauê Sales on 05/07/21.
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
