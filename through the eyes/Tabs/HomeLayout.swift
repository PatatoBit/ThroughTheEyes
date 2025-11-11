//
//  HomeLayout.swift
//  through the eyes
//
//  Created by Patato on 11/11/25.
//

import SwiftUI

struct HomeLayout: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    SimulatorBox(name: "Dyslexia")
                    SimulatorBox(name: "Color blindness")
                    SimulatorBox(name: "ADHD")
                }
                //            .border(.blue, width: 2)
            }
            .padding()
            .toolbar {
                ToolbarItem (placement: .navigation) {
                    Button {
                        hasCompletedOnboarding = false
                    } label: {
                        Image(systemName: "memories")
                            .foregroundColor(.gray)
                    }
                }
            }
        }
    }
}

struct SimulatorBox: View {
    var name: String = "Placeholder"
    var imageName: String = "placeholder"
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //                    .border(Color.purple, width: 3)
            Text("\(name)")
        }
        .frame(maxWidth: .infinity)
        
        //        .border(.red, width: 2)
    }
}

#Preview {
    HomeLayout()
}
