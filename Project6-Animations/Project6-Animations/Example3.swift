//
//  Example3.swift
//  Project6-Animations
//
//  Created by Javier Rodríguez Gómez on 8/1/22.
//

import SwiftUI

struct Example3: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                animationAmount += 360
            }
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
    }
}

struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
