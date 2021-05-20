//
//  ContentView.swift
//  LengthConverter
//
//  Created by Yew Wai Hon on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
  static let meters = "meters"
  static let kilometers = "kilometers"
  static let feet = "feet"
  static let yards = "yards"
  static let miles = "miles"

  @State private var unitsToConvert = ""
  @State private var fromUnit = 0
  @State private var toUnit = 0
  
  let units = [meters, kilometers, feet, yards, miles]
  
  let unitToMillimeters: [String: Double] = [meters: 1_000,
                                             kilometers: 1_000_000,
                                             feet: 304.8,
                                             yards: 914.4,
                                             miles: 1_609_344]

  let millimeterToUnits: [String: Double] = [meters: 0.001,
                                             kilometers: 0.000001,
                                             feet: 0.0032808399,
                                             yards: 0.0010936133,
                                             miles: 0.0000006213711922]
  
  var convertedUnits: String {
    guard unitsToConvert != "" else { return "" }
    
    let selectedFromUnit = units[fromUnit]
    let selectedToUnit = units[toUnit]
    let fromUnits = Double(unitsToConvert) ?? 0
    let millimeters = fromUnits * unitToMillimeters[selectedFromUnit]!
    let toUnits = millimeters * millimeterToUnits[selectedToUnit]!
    return String(format: "%.10f", toUnits)
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("From")) {
          TextField("Number of units", text: $unitsToConvert)
            .keyboardType(.decimalPad)
          Picker("Convert from", selection: $fromUnit) {
            ForEach(0 ..< units.count) {
              Text("\(units[$0])")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("To")) {
          Text(convertedUnits)
          Picker("Convert to", selection: $toUnit) {
            ForEach(0 ..< units.count) {
              Text("\(units[$0])")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
      }
      .navigationTitle("Length Converter")
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
