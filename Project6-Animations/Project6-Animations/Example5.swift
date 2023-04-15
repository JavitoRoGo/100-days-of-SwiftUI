//
//  Example5.swift
//  Project6-Animations
//
//  Created by Javier Rodríguez Gómez on 8/1/22.
//

import SwiftUI

struct Example5: View {
    let letters = Array("Hello SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.yellow, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.spring()) {
                                dragAmount = .zero
                            }
                        }
                )
            .animation(.spring(), value: dragAmount)
            
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? .blue : .red)
                        .offset(dragAmount)
                        .animation(.default.delay(Double(num) / 20), value: dragAmount)
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )
        }
    }
}

struct Example5_Previews: PreviewProvider {
    static var previews: some View {
        Example5()
    }
}
