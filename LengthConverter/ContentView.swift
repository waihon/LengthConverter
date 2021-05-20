//
//  ContentView.swift
//  LengthConverter
//
//  Created by Yew Wai Hon on 20/05/2021.
//

import SwiftUI

struct ContentView: View {
  @State private var unitsToConvert = ""
  @State private var fromUnit = 0
  @State private var toUnit = 0
  
  let fromUnits = ["meters", "kilometers", "feet", "yard", "miles"]
  let toUnits = ["meters", "kilometers", "feet", "yard", "miles"]
  
  var convertedUnits: String {
    return ""
  }
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Convert from")) {
          TextField("Number of units", text: $unitsToConvert)
            .keyboardType(.decimalPad)
          Picker("Convert from", selection: $fromUnit) {
            ForEach(0 ..< fromUnits.count) {
              Text("\(fromUnits[$0])")
            }
          }
          .pickerStyle(SegmentedPickerStyle())
        }
        Section(header: Text("To")) {
          Text("\(convertedUnits)")
          Picker("Convert to", selection: $toUnit) {
            ForEach(0 ..< toUnits.count) {
              Text("\(toUnits[$0])")
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
