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
        QuoteView(show: Constants.bb)
          .tabItem {
            Label(Constants.bb, systemImage: "tortoise")
          }
        
        QuoteView(show: Constants.bcs)
          .tabItem {
            Label(Constants.bcs, systemImage: "briefcase")
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
