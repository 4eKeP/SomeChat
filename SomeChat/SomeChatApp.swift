//
//  SomeChatApp.swift
//  SomeChat
//
//  Created by admin on 05.04.2023.
//

import SwiftUI
import Firebase




@main
struct SomeChatApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
