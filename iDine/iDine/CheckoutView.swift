//
//  CheckoutView.swift
//  iDine
//
//  Created by Eugene Berezin on 8/21/20.
//  Copyright © 2020 Eugene Berezin. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine","Points"]
    
    @State private var paymentType = "0"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1
    @State private var showingPaymentAlert = false
    
    static let tipAmounts = [10, 15, 20, 25, 0]
    
   
    
    
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 *
            Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                Toggle(isOn: $addLoyaltyDetails.animation()) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")")) {
                Button("Confirm order") {
                    self.showingPaymentAlert.toggle()                }
            }
            
        }
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Thank you"),
                  dismissButton: .default(Text("Ok")))
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
    }
    

}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
