//
//  Pizza.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-21.
//

import Foundation
// model for pizza to read nad save in JSOn
struct Pizza: Codable, Identifiable {
    enum CodingKeys: CodingKey {
        case name
        case ingredients
        case imageName
        case thumbnailName
        case type
    }
    var id = UUID()
    var name: String
    var ingredients: String
    var imageName: String
    var thumbnailName: String
    var type: String
    
}

enum PizzaType: String, Encodable {
    case vegetarian = "vegetarian"
    case meat = "meat"
}

let testPizza = Pizza(name: "Beef Sizzler", ingredients: "Green Chillies, Jalapeños, Red Onions, Seasoned Minced Beef", imageName: "beef_sizzler", thumbnailName: "beef_sizzler", type:"meat")



