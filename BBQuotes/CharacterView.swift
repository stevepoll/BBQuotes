//
//  CharacterView.swift
//  BBQuotes
//
//  Created by Esteban Poll on 1/24/24.
//

import SwiftUI

struct CharacterView: View {
  var body: some View {
    GeometryReader { geo in
      ZStack(alignment: .top) {
        // background image
        Image(ShowName.bb.lowercased().replacingOccurrences(of: " ", with: ""))
          .resizable()
          .scaledToFit()
        
        ScrollView {
          // character image
          VStack {
            Image(.jessepinkman)
              .resizable()
              .scaledToFill()
          }
          .frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
          .clipShape(.rect(cornerRadius: 25))
          .padding(.top, 60)
          
          // character info
          VStack(alignment: .leading) {
            Group {
              Text("Jesse Pinkman")
                .font(.largeTitle)
              Text("Portrayed by Aaron Paul")
                .font(.subheadline)
              Divider()
            
              Text("Jesse Pinkman Character Info")
                .font(.title2)
              Text("Born: 09-24-1984")
              Divider()
            }
            
            Group {
              Text("Occupations")
              ForEach(0..<3) { i in
                Text("◦ Job \(i)")
                  .font(.subheadline)
              }
              Divider()
            
              Text("Nicknames")
              ForEach(0..<3) { i in
                Text("◦ Nickname \(i)")
                  .font(.subheadline)
              }
            }
          }
          .padding([.leading, .bottom], 40)
        }
      }
    }
    .ignoresSafeArea()
  }
}

#Preview {
  CharacterView()
}
