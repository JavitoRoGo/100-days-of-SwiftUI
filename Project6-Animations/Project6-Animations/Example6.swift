//
//  Example6.swift
//  Project6-Animations
//
//  Created by Javier Rodríguez Gómez on 8/1/22.
//

import SwiftUI

struct Example6: View {
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap Me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
            }
        }
    }
}

struct Example6_Previews: PreviewProvider {
    static var previews: some View {
        Example6()
    }
}
