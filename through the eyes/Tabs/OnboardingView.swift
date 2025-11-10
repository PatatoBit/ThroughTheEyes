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
                slides[currentSlideIndex]
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                
                HStack {
                    Spacer()
                    Button("Continue") {
                        if currentSlideIndex < slides.count - 1 {
                            currentSlideIndex += 1
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .toolbar {
                
                if currentSlideIndex > 0 {
                    ToolbarItem(placement: .navigation) {
                        Button {
                            currentSlideIndex -= 1
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
