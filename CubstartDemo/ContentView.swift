//
//  ContentView.swift
//  CubstartDemo
//
//  Created by Angel on 9/12/26.
//

import SwiftUI

struct ContentView: View {
    @State private var kimchiRating = ""
    @State private var hankkiRating = ""
    @State private var kostopRating = ""
    
    @State private var average: Double? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("rating berkeley's korean food scene")
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.center)

            Text("wanna see how good berkeley is if you're craving korean? rate these spots from 1–5")
                .foregroundStyle(.secondary)
                .multilineTextAlignment(.center)

            TextField("Kimchi Garden", text: $kimchiRating)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            TextField("Hankki", text: $hankkiRating)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            TextField("Ko Stop", text: $kostopRating)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)

            Button("calculate") {
                calculateAverage()
            }
            .foregroundStyle(.white) // Text color
            .padding(10)
            .background(Color.red)
            
            if let average = average {
                Text("korean food score: \(average, specifier: "%.2f") ⭐️")
                    .font(.title2)
                    .bold()
            }
        }
        .padding()
    }

    func calculateAverage() {
        // CODE BEFORE INTRODUCING OPTIONALS
//        let sum = (Int(kimchiRating)!+Int(hankkiRating)!+Int(kostopRating)!)
//        average = Double(sum/3)
        
        // BETTER CODE USING OPTIONALS
        
        let kimchi: Int? = Int(kimchiRating)
        let hankki: Int? = Int(hankkiRating)
        let kostop: Int? = Int(kostopRating)

        var total = 0
        var count = 0

        if let rating = kimchi {
            total += rating
            count += 1
        }

        if let rating = hankki {
            total += rating
            count += 1
        }

        if let rating = kostop {
            total += rating
            count += 1
        }

        if count > 0 {
            average = Double(total) / Double(count)
        }
    }
}

#Preview {
    ContentView()
}
