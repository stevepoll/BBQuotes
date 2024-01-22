//
//  Quote.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

struct Quote: Decodable {
  let quote: String
  let character: String
  let production: String
}
