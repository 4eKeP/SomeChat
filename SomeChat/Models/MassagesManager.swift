//
//  MassagesManager.swift
//  SomeChat
//
//  Created by admin on 20.04.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessageManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    
    let dataBase = Firestore.firestore()
    
    init() {
        getMessages()
        print(messages)
    }
    
    func getMessages(){
        dataBase.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("Fetching documents error: \(String(describing: error))")
                return
            }
            
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                }catch{
                    print("Decoding document to Message error: \(error)")
                    return nil
                }
            }
            self.messages.sort { $0.timestamp < $1.timestamp }
            
            if let id = self.messages.last?.id{
                self.lastMessageId = id
            }
        }
    }
    
    func sendMessage(text: String) {
        do {
            let newMessage = Message(id: "\(UUID())", received: false, text: text, timestamp: Date())
            try dataBase.collection("messages").document().setData(from: newMessage)
        }catch{
            print("Error adding message to Firestore: \(error)")
        }
    }
}
