//
//  Constants.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

struct ShowName {
  static let bb = "Breaking Bad"
  static let bcs = "Better Call Saul"
}

extension String {
  var replaceSpaceWithPlus: String {
    self.replacingOccurrences(of: " ", with: "+")
  }
}
