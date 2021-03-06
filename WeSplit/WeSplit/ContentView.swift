//
//  ContentView.swift
//  WeSplit
//
//  Created by Adam Nguyen on 8/16/20.
//  Copyright © 2020 Adam Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentageIndex = 2
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var tip: Double {
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentageIndex])
        
        let tipValue = orderAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var grandTotal: Double {
        let orderAmount = Double(checkAmount) ?? 0
        
        let grandTotal = orderAmount + tip
        
        return grandTotal
    }

    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople) ?? 0
        
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                }
                
                Section (header: Text("How much tip do you want to leave?")){
                    Picker("Tip Percentage", selection: $tipPercentageIndex) {
                        ForEach(0..<tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section (header: Text("Tip")) {
                    Text("$\(tip, specifier: "%.2f")")
                }
                
                Section (header: Text("Total Amount")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                        .foregroundColor(tipPercentages[tipPercentageIndex] == 0 ? .red : .primary)
                }
                
                Section (header: Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }.navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
