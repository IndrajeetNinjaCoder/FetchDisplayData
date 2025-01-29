//
//  Model.swift
//  FetchDisplayData
//
//  Created by test on 29/01/25.
//

import Foundation

// we can use Encodable and Decodable in place of Codable
struct People: Identifiable, Codable {
    let id: UUID = UUID()
    let name: String
    let height: String
    let hair_color: String
    let skin_color: String
    let eye_color: String
    let birth_year: String
    let gender: String
    let homeworld: String
    let films: [String]
    let vehicles: [String]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case height
        case hair_color
        case skin_color
        case eye_color
        case birth_year
        case gender
        case homeworld
        case films
        case vehicles
    }
}

struct APIResponse: Codable {
    let results: [People]
}
