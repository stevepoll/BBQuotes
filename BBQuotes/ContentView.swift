//
//  ContentView.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      TabView {
        Text("Breaking Bad View")
          .tabItem {
            Label("Breaking Bad", systemImage: "tortoise")
          }
        
        Text("Better Call Saul View")
          .tabItem {
            Label("Better Call Saul", systemImage: "briefcase")
          }
      }
      .onAppear {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
      }
      .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
