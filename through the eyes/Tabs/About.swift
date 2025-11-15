//
//  About.swift
//  through the eyes
//
//  Created by Patato on 12/11/25.
//

import SwiftUI

struct About: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        VStack {
            Button("Reset onboarding") {
                hasCompletedOnboarding = false
            }
            .buttonStyle(PrimaryCall())
            .sensoryFeedback(.impact, trigger: hasCompletedOnboarding)
            
        }.padding()
    }
}

#Preview {
    About()
}
