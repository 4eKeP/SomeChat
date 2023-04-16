//
//  MessageField.swift
//  SomeChat
//
//  Created by admin on 16.04.2023.
//

import SwiftUI

struct MessageField: View {
    
    @State private var message = ""
    
    var body: some View {
        HStack{
            MessageTextField(placeholder: Text("Enter your message"), text: $message)
            
            Button{
                print("message sent")
                message = ""
            }label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("chatBubble"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("alternativeBubble"))
        .cornerRadius(50)
        .padding()
    }
}

struct MessageField_Previews: PreviewProvider {
    static var previews: some View {
        MessageField()
    }
}


struct MessageTextField: View  {
    var placeholder: Text
    @Binding var text: String
    var editingStatus: (Bool) -> () = {_ in}
    var commit: ()->() = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
            TextField("", text: $text, onEditingChanged: editingStatus, onCommit: commit)
        }
    }

    
}
