//
//  ContentView.swift
//  WeSplit
//
//  Created by Eric Xu on 1/20/24.
//  Copyright © 2024 Eric Xu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //State Variables:
    @State private var costOfBill = 0.0
    @State private var numberOfPeople: Int = 2
    @State private var tipPercentage: Int = 0
    
    //Other Variables:
    let tipPercentages: [Int] = Array(0...100)
    let peopleCounts: [Int] = Array(2...50)
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople)
        let tipSelection = Double(tipPercentage)
        let tipValue = costOfBill * (tipSelection / 100)
        let grandTotal = costOfBill + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Cost of Bill and Number of People") {
                    TextField("Check Amount:", value: $costOfBill, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .keyboardType(.decimalPad)
                    
                    Picker("Number of People", selection: $numberOfPeople) {
                        ForEach(peopleCounts, id: \.self) {
                            Text("\($0) People")
                        }
                    }
                    .pickerStyle(.menu)
                }
                Section("How Much Tip Do You Want To Leave?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text("\($0)%")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("Total Cost of Bill including Tip") {
                    let billTotalCost =  (Double(tipPercentage)/100) * costOfBill + costOfBill
                    Text("\(billTotalCost)")
                }
                Section("Amount Per Person") {
                    HStack {
                        Text("You Should Pay:")
                        Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    }
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




//Extra Code to Reference:
//        Navigation Stacks with Forms to See:
//        NavigationStack {
//            Form {
//                Section {
//                    Text("Hello World!")
//                }
//                Section {
//                    Text("Hello World!")
//                }
//            }
//            .navigationTitle("SwiftUI")
//            .navigationBarTitleDisplayMode(.inline)
//        }
        
//        Buttons:
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }

//        Text Input
//        Form {
//            TextField("Enter your name here:", text: $name)
//            Text("Hello, your name is \(name)!")
//        }

//        Drop-Down List
//        NavigationStack {
//            Form {
//                Picker("Select your student", selection: $selectedStudent) {
//                    ForEach(students, id: \.self) {
//                        Text($0)
//                    }
//                }
//            }
//        }
