//
//  ContentView.swift
//  Project15-Accessibility
//
//  Created by Javier Rodríguez Gómez on 31/1/22.
//

import SwiftUI

struct ContentView: View {
    let pictures = [
        "ales-krivec-15949",
        "galina-n-189483",
        "kevin-horstmann-141705",
        "nicolas-tissot-335096"
    ]
    let labels = [
        "Tulips",
        "Frozen tree buds",
        "Sunflowers",
        "Fireworks"
    ]
    @State private var selectedPicute = Int.random(in: 0...3)
    
    var body: some View {
        Image(pictures[selectedPicute])
            .resizable()
            .scaledToFit()
            .accessibilityLabel(labels[selectedPicute])
            .accessibilityAddTraits(.isButton)
            .accessibilityRemoveTraits(.isImage)
            .onTapGesture {
                selectedPicute = Int.random(in: 0...3)
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
