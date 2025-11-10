//
//  Introduction.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct Introduction: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()

            VStack(alignment: .leading, spacing: -10) {
                Text("hi!").font(.largeTitle).fontDesign(.rounded)
                Text("welcome to").font(.largeTitle).fontDesign(.rounded)
                Text("through the eyes").font(.largeTitle).fontDesign(.rounded).bold()
            }
            
            Text("This app simulates disabilities to help you understand what it’s really like to experience them.")
            
            Spacer()
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).padding(20)
    }
    
}

#Preview {
    Introduction()
}

