//
//  ContentView.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if !hasCompletedOnboarding {
                    OnboardingView()
                } else {
                    HomeLayout()
                        .transition(.opacity)
                }
            }
            .animation(.easeInOut, value: hasCompletedOnboarding)
        }
    }
}

#Preview {
    UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
    return ContentView()
}
