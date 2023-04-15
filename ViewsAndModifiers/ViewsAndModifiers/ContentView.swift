//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Javier Rodríguez Gómez on 28/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var useRedText = false
    var body: some View {
        Text("Algún texto")
            .blur(radius: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct MyModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(MyModifier())
    }
}
