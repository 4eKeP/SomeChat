//
//  ContentView.swift
//  SomeChat
//
//  Created by admin on 05.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var messageArray = ["Hello", "Hi, how are you?", "Do some coding with sinthwave and it's hits hard!"]
    
    
    
    var body: some View {
        VStack {
          TitleRow()
            ScrollView{
                ForEach(messageArray, id: \.self){ text in
                    MessageBubble(message: Message(id: "12345", text: text, received: true, timestamp: Date()))
                    
                }
            }
            .padding(.top, 10)
            .background(.white)
            .cornerRadius(30, corners: [.topLeft, .topRight])
            
        }
        .background(Color("chatBubble"))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
