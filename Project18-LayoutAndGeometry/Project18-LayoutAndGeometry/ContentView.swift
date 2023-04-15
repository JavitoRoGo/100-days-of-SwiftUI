//
//  ContentView.swift
//  Project18-LayoutAndGeometry
//
//  Created by Javier Rodríguez Gómez on 7/2/22.
//

import SwiftUI

struct ContentView: View {
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
                            .background(Color(hue: geo.frame(in: .global).minY / fullView.size.height,
                                              saturation: geo.frame(in: .global).minY / fullView.size.height,
                                              brightness: 1))
                            .opacity(geo.frame(in: .global).minY < 200
                                     ? geo.frame(in: .global).minY / 300
                                     : 1)
                            .scaleEffect(x: geo.frame(in: .global).minY / fullView.size.height,
                                         y: 1,
                                         anchor: .center)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
