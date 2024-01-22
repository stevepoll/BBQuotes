//
//  Constants.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

extension String {
  var replaceSpaceWithPlus: String {
    self.replacingOccurrences(of: " ", with: "+")
  }
}
