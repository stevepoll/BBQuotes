//
//  QuoteView.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/21/24.
//

import SwiftUI

struct QuoteView: View {
  @StateObject private var viewModel = ViewModel(controller: FetchController())
  @State private var showCharacterInfo = false
  let show: String
  
  var body: some View {
    let (buttonColor, shadowColor): (Color, Color) = show == Constants.bb ? (.bbGreen, .bbYellow) : (.bcsBlue, .bcsBrown)
    
    GeometryReader { geo in
      ZStack {
        Image(show.lowercased().replacingOccurrences(of: " ", with: ""))
          .resizable()
          .frame(width: geo.size.width * 2.7, height: geo.size.height)
        VStack(spacing: 32) {
          Spacer(minLength: 32)
          VStack {
            switch viewModel.status {
              case .success(let data):
                Text("\"\(data.quote.quote)\"")
                  .minimumScaleFactor(0.5)
                  .multilineTextAlignment(.center)
                  .padding(.horizontal)
                  .foregroundStyle(.white)
                  .padding()
                  .background(.thinMaterial)
                  .clipShape(.rect(cornerRadius: 20))
                ZStack(alignment: .bottom) {
                  AsyncImage(url: data.character.images[0]) { image in
                    image
                      .resizable()
                      .scaledToFill()
                  } placeholder: {
                    ProgressView()
                  }
                  .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                  .onTapGesture {
                    showCharacterInfo.toggle()
                  }
                  .sheet(isPresented: $showCharacterInfo) {
                    CharacterView(show: show, character: data.character)
                  }

                  Text(data.character.name)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(.ultraThinMaterial)
                }
                .frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
                .clipShape(.rect(cornerRadius: 20))
                
              case .fetching:
                ProgressView()
              default:
                EmptyView()
            }
          }
          
          Spacer()
          
          Button {
            Task {
              await viewModel.getData(for: show)
            }
          } label: {
            Text("Get Random Quote")
              .font(.title)
              .foregroundStyle(.white)
              .padding()
              .background(buttonColor)
              .clipShape(.rect(cornerRadius: 6))
              .shadow(color: shadowColor, radius: 2)
          }
          .padding(.bottom, 96)
          
        }
        .frame(width: geo.size.width/1.2)
      }
      .frame(width: geo.size.width, height: geo.size.height)
    }
    .ignoresSafeArea()
    
  }
}

#Preview {
  QuoteView(show: Constants.bb)
    .preferredColorScheme(.dark)
}
