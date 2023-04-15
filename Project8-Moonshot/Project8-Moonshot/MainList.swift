//
//  MainList.swift
//  Project8-Moonshot
//
//  Created by Javier Rodríguez Gómez on 13/1/22.
//

import SwiftUI

struct MainList: View {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(destination: MissionView(mission: mission)) {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 75, height: 75)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .foregroundColor(.white)
                        Text(mission.formattedLaunchDate)
                            .font(.caption)
                            .foregroundColor(.white.opacity(0.5))
                    }
                    .padding()
                    Spacer()
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
        .background(.darkBackground)
        .preferredColorScheme(.dark)
    }
}

struct MainList_Previews: PreviewProvider {
    static var previews: some View {
        MainList()
            .preferredColorScheme(.dark)
    }
}
