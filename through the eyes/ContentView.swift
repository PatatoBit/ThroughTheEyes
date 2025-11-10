//
//  ContentView.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    let hasCompletedOnboarding = false
    
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
    ContentView()
}
