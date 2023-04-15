//
//  Example4.swift
//  Project6-Animations
//
//  Created by Javier Rodríguez Gómez on 8/1/22.
//

import SwiftUI

struct Example4: View {
    @State private var enabled = false
    
    var body: some View {
        Button("Tap Me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}

struct Example4_Previews: PreviewProvider {
    static var previews: some View {
        Example4()
    }
}
