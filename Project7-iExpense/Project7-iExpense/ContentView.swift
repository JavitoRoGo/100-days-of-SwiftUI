//
//  ContentView.swift
//  Project7-iExpense
//
//  Created by Javier Rodríguez Gómez on 9/1/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(types, id: \.self) { type in
                    Section {
                        ForEach(expenses.items.filter { $0.type == type }) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                Spacer()
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .foregroundColor(item.amount < 10 ? .secondary :
                                                        (item.amount < 100 ? .primary :
                                                        (item.amount >= 100 ? .red : .secondary)))
                            }
                            .accessibilityElement(children: .ignore)
                            .accessibilityLabel("\(item.name) \(item.amount)")
                            .accessibilityHint("\(item.type)")
                        }
                    }
                }
                .onDelete(perform: removeItems)

            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
