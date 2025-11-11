//
//  OnboardingView.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct OnboardingView: View {

  @State private var currentSlideIndex = 0
  let slides: [AnyView] = [AnyView(Introduction()), AnyView(FavouriteColor()), AnyView(Ending())]

  var body: some View {
    NavigationStack {
      VStack {
        TabView(selection: $currentSlideIndex) {
          ForEach(0..<slides.count, id: \.self) { index in
            slides[index]
              .tag(index)
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
          }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))

        HStack {
          Spacer()
          Button("Continue") {
            if currentSlideIndex < slides.count - 1 {
              withAnimation(.easeInOut(duration: 0.35)) {
                currentSlideIndex += 1
              }
            }
          }
          .buttonStyle(PrimaryCall())

            Spacer()
        }
        .padding()
      }
      
    }
  }
}

#Preview {
  OnboardingView()
}
