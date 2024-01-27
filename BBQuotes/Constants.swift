//
//  Constants.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

struct Constants {
  static let bb = "Breaking Bad"
  static let bcs = "Better Call Saul"
  
  static var previewCharacter: Character {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    
    let data = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
    
    return try! decoder.decode([Character].self, from: data)[0]
  }
}

extension String {
  var replaceSpaceWithPlus: String {
    self.replacingOccurrences(of: " ", with: "+")
  }
}
