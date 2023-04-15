//
//  ContentView.swift
//  Challenge1
//
//  Created by Javier Rodríguez Gómez on 27/12/21.
//

import SwiftUI

struct ContentView: View {
    @State private var temperatureInput: Double = 0.0
    enum tempUnits: String, CaseIterable {
        case celsius = "Celsius"
        case farenheit = "Farenheit"
        case kelvin = "Kelvin"
    }
    @State private var tempUnitInput: tempUnits = .celsius
    @State private var tempUnitOutput: tempUnits = .celsius
    var temperatureResult: Measurement<UnitTemperature> {
        switch tempUnitInput {
        case .celsius:
            let celsius = Measurement(value: temperatureInput, unit: UnitTemperature.celsius)
            switch tempUnitOutput {
            case .celsius:
                return celsius
            case .farenheit:
                return celsius.converted(to: .fahrenheit)
            case .kelvin:
                return celsius.converted(to: .kelvin)
            }
        case .farenheit:
            let farenh = Measurement(value: temperatureInput, unit: UnitTemperature.fahrenheit)
            switch tempUnitOutput {
            case .celsius:
                return farenh.converted(to: .celsius)
            case .farenheit:
                return farenh
            case .kelvin:
                return farenh.converted(to: .kelvin)
            }
        case .kelvin:
            let kelvin = Measurement(value: temperatureInput, unit: UnitTemperature.kelvin)
            switch tempUnitOutput {
            case .celsius:
                return kelvin.converted(to: .celsius)
            case .farenheit:
                return kelvin.converted(to: .fahrenheit)
            case .kelvin:
                return kelvin
            }
        }
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the temperature", value: $temperatureInput, format: .number)
                        .keyboardType(.decimalPad)
                    Picker("Initial temperature", selection: $tempUnitInput) {
                        ForEach(tempUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    Picker("Final temperature", selection: $tempUnitOutput) {
                        ForEach(tempUnits.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(temperatureResult)")
                } header: {
                    Text("Temperature")
                }
            }
            .navigationTitle("Unit conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
