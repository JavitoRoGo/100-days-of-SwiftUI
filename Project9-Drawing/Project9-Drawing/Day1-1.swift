//
//  Day1-1.swift
//  Project9-Drawing
//
//  Created by Javier Rodríguez Gómez on 15/1/22.
//

import SwiftUI

struct Day1_1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            path.closeSubpath()
        }
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
    }
}

struct Day1_1_Previews: PreviewProvider {
    static var previews: some View {
        Day1_1()
    }
}
