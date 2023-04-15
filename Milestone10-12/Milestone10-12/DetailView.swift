//
//  DetailView.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 23/1/22.
//

import SwiftUI

struct DetailView: View {
    let user: User
    var formattedDate: String {
        let stringDate = user.registered
        return stringDate.formatted(date: .long, time: .omitted)
    }
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
                .foregroundColor(user.isActive ? .green : .red)
            Text("\(user.name) is \(user.isActive ? "active" : "not active") right now")
                .font(.subheadline)
            
            List {
                Section {
                    HStack {
                        Text("Age:")
                        Spacer()
                        Text(user.age, format: .number)
                    }
                    HStack {
                        Text("Company:")
                        Spacer()
                        Text(user.company)
                    }
                    HStack {
                        Text("email:")
                        Spacer()
                        Text(user.email)
                    }
                    HStack {
                        Text("Address:")
                        Spacer()
                        Text(user.address)
                    }
                    HStack {
                        Text("Registered on:")
                        Spacer()
                        Text(formattedDate)
                    }
                }
                Section("About \(user.name)") {
                    Text(user.about)
                }
                Section("List of Friends") {
                    ForEach(user.friends) { friend in
                        Text(friend.name)
                    }
                }
            }
        }
        .navigationTitle("User detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: User.dataTest)
    }
}
