//
//  ContentView.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import SwiftUI

struct ContentView: View {
    let createSymbol = Image(systemName: "plus.app")
    var body: some View {
        NavigationView {
            // Notes list
            List {
                Text("No notes created, click \(createSymbol) to create one")
            }
            .navigationTitle("Notes")

            // Bottom bar
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button(action: {}) {
                        Text(createSymbol)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
