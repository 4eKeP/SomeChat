//
//  Message.swift
//  SomeChat
//
//  Created by admin on 12.04.2023.
//

import Foundation


struct Message: Identifiable, Codable{
    var id: String
    var received: Bool
    var text: String
    var timestamp: Date
    
}
