//
//  SimulatorGrid.swift
//  through the eyes
//
//  Created by Patato on 12/11/25.
//

import SwiftUI

struct SimulatorGrid: View {
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                LazyVGrid(columns: columns, spacing: 25) {
                    SimulatorBox(name: "Dyslexia", destination: Dyslexia())
                    SimulatorBox(name: "Color blindness", destination: ColorBlindness())
                    SimulatorBox(name: "ADHD", destination:  ADHD())
                    SimulatorBox(name: "Blindness", destination: Blindness())
                    SimulatorBox(name: "Low vision", destination: LowVision())
                }
                //            .border(.blue, width: 2)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
            
        }
    }
}

struct SimulatorBox<Destination: View>: View {
    var name: String = "Placeholder"
    var imageName: String = "placeholder"
    var destination: Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
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
        .buttonStyle(PlainButtonStyle())
        
    }
}

#Preview {
    SimulatorGrid()
}
