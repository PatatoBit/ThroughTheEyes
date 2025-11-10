//
//  FavouriteColor.swift
//  through the eyes
//
//  Created by Patato on 10/11/25.
//

import SwiftUI

struct FavouriteColor: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Spacer()

            VStack(alignment: .leading, spacing: -10) {
                Text("First, what’s your favorite color?").font(.largeTitle).fontDesign(.rounded)
            }
            
            Text("We’ll use it to make your experience more personal and vibrant.")
            
            Spacer()
            
           
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).padding(20)
    }
}

#Preview {
    FavouriteColor()
}
