//
//  Day1-2.swift
//  Project9-Drawing
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import SwiftUI

struct Day1_2: View {
    struct Triangle: Shape {
        func path(in rect: CGRect) -> Path {
            var path = Path()

            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

            return path
        }
    }
    struct Arc: Shape {
        var startAngle: Angle
        var endAngle: Angle
        var clockwise: Bool

        func path(in rect: CGRect) -> Path {
            let rotationAdjustment = Angle.degrees(90)
                let modifiedStart = startAngle - rotationAdjustment
                let modifiedEnd = endAngle - rotationAdjustment

                var path = Path()
                path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

                return path
        }
    }
    
    var body: some View {
        VStack {
            Triangle()
                .stroke(.red, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
            .frame(width: 300, height: 300)
            
            Arc(startAngle: .degrees(0), endAngle: .degrees(110), clockwise: true)
                .stroke(.blue, lineWidth: 10)
                .frame(width: 300, height: 300)
        }
    }
}

struct Day1_2_Previews: PreviewProvider {
    static var previews: some View {
        Day1_2()
    }
}
