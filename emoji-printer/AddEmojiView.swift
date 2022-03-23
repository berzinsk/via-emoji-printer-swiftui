//
//  AddEmojiView.swift
//  emoji-printer
//
//  Created by karlis.berzins on 23/03/2022.
//

import SwiftUI

struct AddEmojiView: View {
  @Binding var isPresented: Bool
  @Binding var emojis: [String]
  @Binding var emojiString: String
  @State private var text = ""
  
  var body: some View {
    VStack {
      Text("Hello, World!")
      TextField("Enter emoji", text: $text)
      Button("Add and close") {
        emojis.append(text)
        emojiString = emojis.joined(separator: " ")
        isPresented = false
      }
    }
    .padding()
  }
}
