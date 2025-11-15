//
//  OnboardingView.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct OnboardingView: View {
  @State private var currentSlideIndex = 0
  @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false

  let slides: [AnyView] = [AnyView(Introduction()), AnyView(FavouriteColor()), AnyView(Ending())]

  func completeOnboarding() {
    hasCompletedOnboarding = true
  }

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
            } else if currentSlideIndex == slides.count - 1 {
              completeOnboarding()
            }
          }
          .buttonStyle(PrimaryCall(fullWidth: true))
          .sensoryFeedback(.impact, trigger: currentSlideIndex)

          Spacer()
        }
        .padding()
      }

    }
  }
}

#Preview {
  UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
  return OnboardingView()
}
