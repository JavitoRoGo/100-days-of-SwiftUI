//
//  AddView.swift
//  Milestone13-15
//
//  Created by Javier Rodríguez Gómez on 1/2/22.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var model: MyThingModel
    @Environment(\.dismiss) var dismiss
    @State private var showingImagePicker = false
    @State private var name: String = ""
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var readLocation = false
    var disableSaveButton: Bool {
        if let _ = image, !name.isEmpty, name != " ", readLocation {
            return false
        } else {
            return true
        }
    }
    let locationFetcher = LocationFetcher()
    @State private var latitude: Double?
    @State private var longitude: Double?
    
    var body: some View {
        VStack(spacing: 30) {
            TextField("Enter your text", text: $name)
                .padding()
                .clipShape(Capsule())
                .overlay(Capsule().stroke())
            ZStack {
                Rectangle()
                    .fill(.tertiary)
                image?
                    .resizable()
                    .scaledToFit()
            }
            Button("Add image") {
                self.locationFetcher.start()
                showingImagePicker = true
            }
            .frame(width: 384, height: 52)
            .foregroundColor(.white)
            .background(.indigo)
            .clipShape(Capsule())
            
            Button("Read location") {
                if let location = self.locationFetcher.lastKnownLocation {
                    latitude = location.latitude
                    longitude = location.longitude
                    readLocation = true
                }
            }
            .frame(width: 384, height: 52)
            .foregroundColor(.white)
            .background(.orange)
            .clipShape(Capsule())
            
            Spacer()
        }
        .padding()
        .navigationTitle("Add new data")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button("Save", action: save)
            .disabled(disableSaveButton)
        }
        .onChange(of: inputImage) { _ in loadImage() }
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $inputImage)
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func save() {
        guard let inputImage = inputImage else { return }
        let saver = ImageSaver()
        saver.writeToDisk(image: inputImage, name: name)
        
        let newItem = MyThing(id: UUID(), name: name, latitude: latitude!, longitude: longitude!)
        model.myThings.insert(newItem, at: 0)
        dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
            .environmentObject(MyThingModel())
    }
}
