//
//  ContentView.swift
//  ParcelAppCalculator
//
//  Created by Sameera Sandakelum on 2025-10-16.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""

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

            Button("Calculate Cost") {

            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
