//
//  ContentView.swift
//  emoji-printer
//
//  Created by karlis.berzins on 23/03/2022.
//

import SwiftUI

struct ContentView: View {
  @State private var isAddEmojiViewVisible = false
  @State private var emojis = [String]()
  @State private var emojiString = ""

  var body: some View {
    VStack {
      Text(emojiString)
        .padding()
      Button("Open modal") {
        isAddEmojiViewVisible = true
      }
    }
    .sheet(isPresented: $isAddEmojiViewVisible) {
      AddEmojiView(isPresented: $isAddEmojiViewVisible, emojis: $emojis, emojiString: $emojiString)
    }
  }
}
