//
//  EmojiViewModel.swift
//  emoji-printer
//
//  Created by karlis.berzins on 23/03/2022.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class EmojiViewModel: NSObject, ObservableObject {
  @Published var emojiString = ""
  private let dbRef = Database.database().reference()
  private let path = "emoji"

  override init() {
    super.init()

    dbRef.child(path).observe(.value) { snapshot in
      guard let children = snapshot.children.allObjects as? [DataSnapshot] else {
        return
      }

      let emojis: [String] = children.compactMap { child in
        let emoji = try? child.data(as: Emoji.self)
        return emoji?.icon
      }

      self.emojiString = emojis.joined(separator: " ")
    }
  }

  func add(emojiIcon: String) {
    guard let autoId = dbRef.child(path).childByAutoId().key else {
      return
    }

    let emoji = Emoji(id: autoId, icon: emojiIcon)

    do {
      try dbRef.child("\(path)/\(emoji.id)").setValue(from: emoji)
    } catch let error {
      print(error.localizedDescription)
    }
  }
}
