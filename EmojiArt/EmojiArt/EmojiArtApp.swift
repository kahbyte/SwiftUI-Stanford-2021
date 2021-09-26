//
//  EmojiArtApp.swift
//  EmojiArt
//
//  Created by Kauê Sales on 26/09/21.
//

import SwiftUI

@main
struct EmojiArtApp: App {
    let document = EmojiArtDocument()
    
    var body: some Scene {
        WindowGroup {
            EmojiArtDocumentView(document: document)
        }
    }
}
