//
//  ContentView.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import SwiftUI

struct ContentView: View {
    let createSymbol = Image(systemName: "plus.app")

    @State var createNotePopupShown: Bool = false
    @State var noteName: String = ""
    @State var noteContents: String = ""

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
                    Button("\(createSymbol)") {
                        createNotePopupShown = true
                    }
                }
            }

            // Create new note popover
            .popover(isPresented: $createNotePopupShown) {
                NavigationView {
                    Form {
                        Section(header: Text("Details")) {
                            TextField("Name", text: $noteName)
                            TextField("Contents", text: $noteContents, axis: .vertical)
                        }
                    }.navigationTitle("Create a new note")

                        .toolbar {
                            ToolbarItem(placement: .bottomBar) {
                                Button("Done") {
                                    let note = Note(name: noteName, data: noteContents)
                                    print(note)
                                    noteName = ""
                                    noteContents = ""
                                    createNotePopupShown = false
                                }
                            }
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
