//
//  ContentView.swift
//  Milestone10-12
//
//  Created by Javier Rodríguez Gómez on 23/1/22.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    @State private var showingSaving = false
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var usersInCD: FetchedResults<UserInCD>
    
    var body: some View {
        NavigationView {
            List(users) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(user.name)
                                .font(.headline)
                            Text(user.age, format: .number)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Image(systemName: user.isActive ? "person.fill.checkmark" : "person.fill.xmark")
                            .font(.title2)
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationTitle("\(users.count) users")
            .toolbar {
                Button("Save") {
                    saveData()
                }
            }
            .alert("Data saved to CoreData", isPresented: $showingSaving) {
                Button("OK") { }
            }
        }
        .task {
            if users.isEmpty && usersInCD.isEmpty {
                await loadData()
            } else if !usersInCD.isEmpty {
                loadFromCoreData()
                print("Data loaded from CoreData")
            }
        }
    }
    
    func loadData() async {
        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            users = try decoder.decode([User].self, from: data)
            print("Data loaded from url")
        } catch {
            print("Error: \(error)")
        }
    }
    
    func saveData() {
        for user in users {
            var friends = [FriendInCD]()
            for friend in user.friends {
                let newFriend = FriendInCD(context: moc)
                newFriend.id = friend.id
                newFriend.name = friend.name
                friends.append(newFriend)
            }
            let newUser = UserInCD(context: moc)
            newUser.id = user.id
            newUser.isActive = user.isActive
            newUser.name = user.name
            newUser.age = Int16(user.age)
            newUser.company = user.company
            newUser.email = user.email
            newUser.address = user.address
            newUser.about = user.about
            newUser.registered = user.registered
            newUser.friend = Set(friends) as NSSet
            
            try? moc.save()
        }
        
        showingSaving = true
    }
    
    func loadFromCoreData() {
        for user in usersInCD {
            var friends = [Friend]()
            for friend in user.friendArray {
                let newFriend = Friend(id: friend.wrappedID, name: friend.wrappedName)
                friends.append(newFriend)
            }
            let newUser = User(id: user.wrappedID, isActive: user.isActive, name: user.wrappedName, age: Int(user.age), company: user.wrappedCompany, email: user.wrappedEmail, address: user.wrappedAddress, about: user.wrappedAbout, registered: user.registered, friends: friends)
            users.append(newUser)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
