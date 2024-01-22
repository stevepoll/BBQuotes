//
//  ViewModel.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

class ViewModel: ObservableObject {
  enum Status {
    case notStarted
    case fetching
    case success(data: (quote: Quote, character: Character))
    case failed(error: Error)
  }
  
  @Published private(set) var status: Status = .notStarted
  
  private let controller: FetchController
  
  init(controller: FetchController) {
    self.controller = controller
  }
  
  func getData(for show: String) async {
    status = .fetching
    
    do {
      let quote = try await controller.fetchQuote(from: show)
      let character = try await controller.fetchCharater(quote.character)
      status = .success(data: (quote, character))
    } catch {
      status = .failed(error: error)
    }
  }
}
