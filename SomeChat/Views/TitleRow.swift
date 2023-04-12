//
//  TitleRow.swift
//  SomeChat
//
//  Created by admin on 12.04.2023.
//

import SwiftUI

struct TitleRow: View {
    var imageurl = URL(string: "https://images.unsplash.com/photo-1680691406946-a9e3ed2e4173?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80")
    var name = "Tapok Obichniy"
    var body: some View {
        HStack(spacing: 20) {
            AsyncImage(url: imageurl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading) {
                Text(name)
                    .font(.title)
                    .bold()
                
                Text("Online")
                    .font(.caption)
                    .foregroundColor(Color("online"))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(Color("online"))
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("chatBubble"))
    }
}
