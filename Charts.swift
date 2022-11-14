//
//  ContentView.swift
//  Relievio Chart
//
//  Created by Gulden on 11/5/22.
//

import Charts
import SwiftUI

struct Item: Identifiable {
    var id = UUID()
    let type: String
    let value: Double
}

struct ContentView: View {

    let items: [Item] = [
        Item(type: "Monday", value: 20),
        Item(type: "Tuesday", value: 60),
        Item(type: "Wednesday", value: 40),
        Item(type: "Thursday", value: 50),
        Item(type: "Friday", value: 75),
        Item(type: "Saturday", value: 35),
        Item(type: "Sunday", value: 20),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                Chart(items) { item in
                    LineMark(
                        x: .value("Day", item.type),
                        y: .value("Stress Level", item.value)
                    )
                    .foregroundStyle(Color.blue)
                    .interpolationMethod(.cardinal)
                }
                .frame(height: 200)
                .padding()
                
                Chart(items) { item in
                    BarMark(
                        x: .value("Day", item.type),
                        y: .value("Stress Level", item.value)
                    )
                    .foregroundStyle(by: .value("Stress Level", item.value))
                    
                }
                .frame(height: 200)
                .padding()
            }
            .navigationTitle("Stress level data")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


// reference: https://www.youtube.com/watch?v=KVz_I10R-wA
