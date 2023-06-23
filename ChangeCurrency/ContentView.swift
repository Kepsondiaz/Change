//
//  ContentView.swift
//  SwiftUiBasics
//
//  Created by Kheraba on 22/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var amount = 0.0
    @State private var choiceCurency = "XOF"
    @State private var choiceCurrencyChange = "XOF"
    let curency  = ["XOF", "€", "$", "₦"]
    
    var change: Double {
        if (choiceCurency=="XOF" && choiceCurrencyChange=="€") {
            return amount / 650
        }
        
        if (choiceCurency=="XOF" && choiceCurrencyChange=="$") {
            return amount / 400
        }
        
        if (choiceCurency=="XOF" && choiceCurrencyChange=="₦") {
            return amount / 0.37
        }
        
        if (choiceCurency=="€" && choiceCurrencyChange=="XOF") {
            return amount * 650
        }
        
        if (choiceCurency=="$" && choiceCurrencyChange=="XOF") {
            return amount * 400
        }
        
        if (choiceCurency=="₦" && choiceCurrencyChange=="XOF") {
            return amount * 650
        }
        
        return amount
    }
    
    var getCurrency: String {
        return choiceCurency
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("currency", selection: $choiceCurency) {
                        ForEach(curency, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.segmented)
                    }
                    TextField("enter amount", value: $amount, format: .currency(code: getCurrency)
                        ).keyboardType(.decimalPad)

                }
                
                Section {
                    Picker("currency", selection: $choiceCurrencyChange) {
                        ForEach(curency, id: \.self) {
                            Text($0)
                        }
                        .pickerStyle(.segmented)
                    }
                    Text(change, format: .currency(code: getCurrency))
                }
            }
            .navigationTitle("Change your currency")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

