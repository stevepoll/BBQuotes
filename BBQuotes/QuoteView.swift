//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
      GeometryReader { geo in
        ZStack {
          Image(.breakingbad)
            .resizable()
            .frame(width: geo.size.width * 2.7, height: geo.size.height)
          VStack(spacing: 32) {
            Text("\"You either run from things or you face them, Mr. White\"")
              .multilineTextAlignment(.center)
              .padding(.horizontal)
              .foregroundStyle(.white)
              .padding()
              .background(.thinMaterial)
              .clipShape(.capsule)
            ZStack(alignment: .bottom) {
              Image(.jessepinkman)
                .resizable()
                .scaledToFill()
              Text("Jesse Pinkman")
                .padding()
                .frame(maxWidth: .infinity)
                .background(.ultraThinMaterial)
            }
            .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
            .clipShape(RoundedRectangle(cornerRadius: 50))
          }
          .frame(width: geo.size.width/1.2)
        }
        .frame(width: geo.size.width, height: geo.size.height)
      }
      .ignoresSafeArea()
    }
}

#Preview {
    QuoteView()
    .preferredColorScheme(.dark)
}
