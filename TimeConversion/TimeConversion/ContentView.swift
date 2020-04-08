//
//  ContentView.swift
//  TimeConversion
//
//  Created by Jeremy Xue on 2020/4/8.
//  Copyright © 2020 Jeremy Xue. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timeValue = ""
    @State private var originTimeUnitIndex = 0
    @State private var conversionTimeUnitIndex = 0
    
    enum TimeUnit: CaseIterable {
        case sec, min, hr, d
        
        var name: String {
            switch self {
            case .sec: return "second"
            case .min: return "minute"
            case .hr : return "hour"
            case .d  : return "day"
            }
        }
        
        var value: Double {
            switch self {
            case .sec: return 1
            case .min: return 60
            case .hr : return 3600
            case .d  : return 86400
            }
        }
    }
    
    let timeUnits = TimeUnit.allCases
    
    var originTimeUnit: TimeUnit {
        timeUnits[originTimeUnitIndex]
    }
    
    var conversionTimeUnit: TimeUnit {
        timeUnits[conversionTimeUnitIndex]
    }
    
    var coversionResult: Double {
        let timeValue = Double(self.timeValue) ?? 0
        return (originTimeUnit.value * timeValue) / conversionTimeUnit.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Original Time Settings")) {
                    TextField("Time value", text: $timeValue)
                        .keyboardType(.numberPad)
                    Picker("Original time unit", selection: $originTimeUnitIndex) {
                        ForEach(0..<timeUnits.count) {
                            Text(self.timeUnits[$0].name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Conversion Unit")) {
                    Picker("Conversion time unit", selection: $conversionTimeUnitIndex) {
                        ForEach(0..<timeUnits.count) {
                            Text(self.timeUnits[$0].name)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Reuslt")) {
                    Text("\(coversionResult) \(conversionTimeUnit.name + "s")")
                }
            }
            .navigationBarTitle("TimeConversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
