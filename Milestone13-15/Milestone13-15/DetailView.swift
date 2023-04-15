//
//  DetailView.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 1/2/22.
//

import MapKit
import SwiftUI

struct DetailView: View {
    @EnvironmentObject var model: MyThingModel
    let myItem: MyThing
    
    var body: some View {
        VStack {
            model.image(myItem.name)
                .resizable()
                .scaledToFit()
            
            Map(coordinateRegion: $model.mapRegion, annotationItems: [myItem]) { _ in
                MapMarker(coordinate: myItem.coordinate)
            }
        }
        .padding()
        .navigationTitle(myItem.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(myItem: MyThing.example)
            .environmentObject(MyThingModel())
    }
}
