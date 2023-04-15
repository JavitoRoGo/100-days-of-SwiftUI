//
//  ResortImage.swift
//  Project19-SnowSeeker
//
//  Created by Javier Rodríguez Gómez on 11/2/22.
//

import SwiftUI

struct ResortImage: View {
    let resort: Resort
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(resort.id)
                .resizable()
                .scaledToFit()
            Text(resort.imageCredit)
                .font(.caption)
                .foregroundColor(.white)
                .padding(3)
                .background(.tertiary)
                .padding(3)
        }
    }
}

struct ResortImage_Previews: PreviewProvider {
    static var previews: some View {
        ResortImage(resort: Resort.example)
    }
}
