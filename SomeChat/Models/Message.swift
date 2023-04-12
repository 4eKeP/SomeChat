//
//  Message.swift
//  SomeChat
//
//  Created by admin on 12.04.2023.
//

import Foundation


struct Message: Identifiable, Codable{
    var id: String
    var text: String
    var received: Bool
    var timestamp: Date
    
}
