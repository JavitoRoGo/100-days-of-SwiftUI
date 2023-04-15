//
//  ListView.swift
//  Milestone16-18
//
//  Created by Javier Rodríguez Gómez on 9/2/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var model: RolledModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List(model.totalRolled) { roll in
                HStack {
                    Text(roll.dice)
                    Spacer()
                    Text(roll.roll, format: .number)
                }
            }
            .navigationTitle("Total rolled")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        model.save()
                    }
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(RolledModel())
    }
}
