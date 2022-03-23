//
//  AddEmojiView.swift
//  emoji-printer
//
//  Created by karlis.berzins on 23/03/2022.
//

import SwiftUI

struct AddEmojiView: View {
  @Binding var isPresented: Bool
  var viewModel: EmojiViewModel
  @State private var text = ""
  
  var body: some View {
    VStack {
      Text("Hello, World!")
      TextField("Enter emoji", text: $text)
      Button("Add and close") {
        viewModel.add(emojiIcon: text)
        isPresented = false
      }
    }
    .padding()
  }
}
