//
//  HomeLayout.swift
//  through the eyes
//
//  Created by Patato on 11/11/25.
//

import SwiftUI

struct HomeLayout: View {
    @State private var tabSelection = 0
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            Tab("Home", systemImage: "house.fill", value: 0) {
                SimulatorGrid()
  
            }
            
            Tab("About", systemImage: "info.circle.fill", value: 1) {
                About()
            }
        }
    }
}


#Preview {
    HomeLayout()
}
