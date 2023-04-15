//
//  ContentView.swift
//  Project19-SnowSeeker
//
//  Created by Javier Rodríguez Gómez on 9/2/22.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    @State private var searchText = ""
    var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    @StateObject var favorites = Favorites()
    
    var sortedResorts: [Resort] {
        switch sortSelection {
        case .byDefault:
            return filteredResorts
        case .byAlphabet:
            return filteredResorts.sorted { $0.name < $1.name }
        case .byCountry:
            return filteredResorts.sorted { $0.country < $1.country }
        }
    }
    @State private var sortSelection: SortingOptions = .byDefault
    enum SortingOptions: String, CaseIterable {
        case byDefault = "Default order"
        case byAlphabet = "Alphabetical order"
        case byCountry = "Country order"
    }
    
    var body: some View {
        NavigationView {
            List(sortedResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Picker("Sort", selection: $sortSelection) {
                    ForEach(SortingOptions.allCases, id: \.self) { sort in
                        Text(sort.rawValue)
                    }
                }
                .pickerStyle(.menu)
            }
            
            WelcomeView()
        }
        .phoneOnlyStackNavigationVew()
        .environmentObject(favorites)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    @ViewBuilder func phoneOnlyStackNavigationVew() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}
