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
        QuoteView(show: ShowName.bb)
          .tabItem {
            Label(ShowName.bb, systemImage: "tortoise")
          }
        
        QuoteView(show: ShowName.bcs)
          .tabItem {
            Label(ShowName.bcs, systemImage: "briefcase")
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
