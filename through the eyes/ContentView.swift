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
            if !hasCompletedOnboarding {
                OnboardingView()
            } else {
                VStack {
                    Text("Hello world")
                }
            }
        }
    }
}

#Preview {
    UserDefaults.standard.set(false, forKey: "hasCompletedOnboarding")
    return ContentView()
}
