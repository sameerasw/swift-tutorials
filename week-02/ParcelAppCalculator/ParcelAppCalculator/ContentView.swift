//
//  ContentView.swift
//  ParcelAppCalculator
//
//  Created by Sameera Sandakelum on 2025-10-16.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var width: String = ""
    @State private var depth: String = ""
    @State private var cost: String = ""

    var isDisabled: Bool {
        weight.isEmpty || height.isEmpty || width.isEmpty || depth.isEmpty
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("📦 Parcel Calculator")
                .font(.title)
                .padding()

            HStack(alignment: .center, spacing: 10) {
                Label("Weight (kg):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)

                TextField("Enter weight", text: $weight)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }

            HStack(alignment: .center, spacing: 10) {
                Label("Height (cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)

                TextField("Enter height", text: $height)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }

            HStack(alignment: .center, spacing: 10) {
                Label("Width (cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)

                TextField("Enter width", text: $width)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }

            HStack(alignment: .center, spacing: 10) {
                Label("Depth (cm):", systemImage: "")
                    .labelStyle(.titleOnly)
                    .frame(width: 120, alignment: .trailing)

                TextField("Enter depth", text: $depth)
                    .textFieldStyle(.roundedBorder)
                    .border(Color.black, width: 2)
                    .keyboardType(.decimalPad)
            }

            HStack{
                Spacer()

                Button("Calculate Cost") {
                    print("Parcel Data:")
                    print("Height: \(height)")
                    print("Width: \(width)")
                    print("Depth: \(depth)")
                    print("Weight: \(weight)")

                    if let heightValue = Double(height), let widthValue = Double(width), let depthValue = Double(depth), let weightValue = Double(weight),
                        weightValue > 0, heightValue > 0, widthValue > 0, depthValue > 0 {
                        let volume = heightValue * widthValue * depthValue
                        var totalCost = 3.00 // base cost

                        // weight charge
                        totalCost += weightValue * 0.50
                        // volume charge
                        totalCost += (volume/1000) * 0.10
                        // ensure minimum charge
                        totalCost = max(totalCost, 4.00)
                        cost = String(format: "%.2f", totalCost)
                        print("£"+cost)
                    } else {
                        print("Error: Enter a valid numeric amount")
                    }
                }
                .buttonStyle(.borderedProminent)
                .padding()
                .disabled(isDisabled)
            }

            if !cost.isEmpty {
                if let costValue = Double(cost), costValue > 0.00 {
                    Text("Total cost is £\(cost)")
                } else {
                    Text("\(cost)")
                        .foregroundColor(.red)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
