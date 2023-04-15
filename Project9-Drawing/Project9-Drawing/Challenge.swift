//
//  Challenge.swift
//  Project9-Drawing
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import SwiftUI

struct Challenge: View {
    @State private var lineWidth: CGFloat = 1
    @State private var startPoint: UnitPoint = .top
    @State private var endPoint: UnitPoint = .bottom
    let points: [UnitPoint] = [.trailing, .bottom, .top, .bottomLeading, .bottomTrailing, .center, .topLeading, .topTrailing, .leading]
    
    var body: some View {
        VStack {
            Arrow()
                .stroke(.blue, lineWidth: lineWidth)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    withAnimation {
                        lineWidth = CGFloat.random(in: 1...50)
                    }
                }
            
            ColorCyclingRectangle(startPoint: startPoint, endPoint: endPoint)
                .padding()
                .onTapGesture {
                    withAnimation {
                        startPoint = points.randomElement()!
                        endPoint = points.randomElement()!
                    }
                }
        }
    }
}

struct Challenge_Previews: PreviewProvider {
    static var previews: some View {
        Challenge()
    }
}


struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.move(to: CGPoint(x: rect.minX, y: rect.maxY / 3))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY / 3))
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 200
    var startPoint: UnitPoint = .top
    var endPoint: UnitPoint = .bottom
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) { value in
                Rectangle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                color(for: value, brightness: 1),
                                color(for: value, brightness: 0.5)
                            ]),
                            startPoint: startPoint,
                            endPoint: endPoint
                        ),
                        lineWidth: 2
                    )
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brightness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        if targetHue > 1 {
            targetHue -= 1
        }
        return Color(hue: targetHue, saturation: 1, brightness: brightness)
    }
}
