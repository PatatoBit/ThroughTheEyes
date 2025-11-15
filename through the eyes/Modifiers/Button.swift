//
//  Button.swift
//  through the eyes
//
//  Created by Patato on 11/11/25.
//

import SwiftUI

struct PrimaryCall: ButtonStyle {
    var fullWidth: Bool = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
            .foregroundColor(.white)
            .background(Color.primaryBlue)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
            .bold()
    }
}

// Haptics

struct HapticTapModifier: ViewModifier {
    @State private var trigger = false
    var feedback: SensoryFeedback

    func body(content: Content) -> some View {
        content
            .onTapGesture {
                trigger.toggle()
            }
            .sensoryFeedback(feedback, trigger: trigger)
    }
}

extension View {
    func hapticTap(_ feedback: SensoryFeedback = .impact(weight: .light)) -> some View {
        modifier(HapticTapModifier(feedback: feedback))
    }
}
