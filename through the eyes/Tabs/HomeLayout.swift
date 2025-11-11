//
//  HomeLayout.swift
//  through the eyes
//
//  Created by Patato on 11/11/25.
//

import SwiftUI

struct HomeLayout: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                SimulatorBox(name: "hi")
                SimulatorBox(name: "hi")
                SimulatorBox()
            }
            .border(.blue, width: 2)
        }
    }
}

struct SimulatorBox: View {
    var name: String = "No Name"
    
    var body: some View {
        VStack {
            Image("yourImageName")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity)
                    .aspectRatio(1, contentMode: .fit)
                    .border(Color.purple, width: 3)
            
            
            Text("\(name)")
        }
        .frame(maxWidth: .infinity)
        .border(.red, width: 2)
    }
}

#Preview {
    HomeLayout()
}
