//
//  emoji_printerApp.swift
//  emoji-printer
//
//  Created by karlis.berzins on 23/03/2022.
//

import SwiftUI
import Firebase

@main
struct emoji_printerApp: App {
  init() {
    FirebaseApp.configure()
  }

  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
