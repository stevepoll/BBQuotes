//
//  Character.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

struct Character: Decodable {
  let name: String
  let birthday: String
  let occupations: [String]
  let images: [URL]
  let aliases: [String]
  let portrayedBy: String
}
