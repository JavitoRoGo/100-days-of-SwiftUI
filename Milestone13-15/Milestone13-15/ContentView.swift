//
//  ContentView.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: MyThingModel
    
    var body: some View {
        NavigationView {
            List(model.myThings) { item in
                NavigationLink(destination: DetailView(myItem: item)) {
                    HStack {
                        Text(item.name)
                            .font(.title3)
                        Spacer()
                        model.image(item.name)
                            .resizable()
                            .frame(width: 50, height: 50)
                    }
                }
            }
            .navigationTitle("My List of Things")
            .toolbar {
                NavigationLink(destination: AddView()) {
                    Label("Add new", systemImage: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MyThingModel())
    }
}
