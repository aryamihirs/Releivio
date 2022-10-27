//
//  ContentView.swift
//  Relevio
//
//  Created by Arya Mihir Singh on 10/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            VStack {
                Text("Turtle")
                    .foregroundColor(Color.green)
            }
            Text("Some View!")
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
