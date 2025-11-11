//
//  Ending.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct Ending: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()

            VStack(alignment: .leading, spacing: -10) {
                Text("Now, explore all the simulations.").font(.largeTitle).fontDesign(.rounded)
            }
            
            Text("Complete them and you’ll get a special hand-drawn illustration from me! (Pat)")
            
            Spacer()
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).padding(20)
    }
}

#Preview {
    Ending()
}
