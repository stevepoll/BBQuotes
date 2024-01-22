//
//  FetchController.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import Foundation

struct FetchController {
  enum NetworkError: Error {
    case badURL, badResponse
  }
  
  private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
  
  func fetchQuote(from show: String) async throws -> Quote {
    let quoteUrl = baseURL.appending(path: "quotes/random")
    var quoteComponents = URLComponents(url: quoteUrl, resolvingAgainstBaseURL: true)
    let quoteQueryItem = URLQueryItem(name: "production", value: show.replaceSpaceWithPlus)
    quoteComponents?.queryItems = [quoteQueryItem]
    
    guard let fetchUrl = quoteComponents?.url else {
      throw NetworkError.badURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: fetchUrl)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw NetworkError.badResponse
    }
    
    let quote = try JSONDecoder().decode(Quote.self, from: data)
    
    return quote
  }
  
  func fetchCharater(_ name: String) async throws -> Character {
    let characterUrl = baseURL.appending(path: "characters")
    var characterComponents = URLComponents(url: characterUrl, resolvingAgainstBaseURL: true)
    let characterQueryItem = URLQueryItem(name: "name", value: name.replaceSpaceWithPlus)
    characterComponents?.queryItems = [characterQueryItem]
    
    guard let fetchUrl = characterComponents?.url else {
      throw NetworkError.badURL
    }
    
    let (data, response) = try await URLSession.shared.data(from: fetchUrl)
    
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
      throw NetworkError.badResponse
    }
    
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    let characters = try decoder.decode([Character].self, from: data)
    
    return characters[0]
  }
}
