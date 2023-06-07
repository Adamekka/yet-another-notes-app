//
//  ContentView.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import SwiftUI

struct ContentView: View {
    // Constants
    let createSymbol = Image(systemName: "plus.app")

    // Global variables
    var notes = Notes()

    // Note states
    @State var createNotePopoverShown: Bool = false
    @State var noteName: String = ""
    @State var noteContents: String = ""

    // Alert states
    @State var noNoteNameAlertShown: Bool = false

    var body: some View {
        NavigationView {
            // Notes list
            //if notes.notes.isEmpty {
            //List {
            //    Text("No notes created, click \(createSymbol) to create one")
            //}
            //.navigationTitle("Notes")
            //}
            List(notes.notes) { note in
                Section {
                    Text(note.name)
                        .fontWeight(.heavy)
                    Text(note.data)
                }
            }
            .navigationTitle("Notes")

            // Bottom bar
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Button("\(createSymbol)") {
                        createNotePopoverShown = true
                    }
                }
            }

            // Create new note popover
            .popover(isPresented: $createNotePopoverShown) {
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
                                    // Handle no note name
                                    if noteName.isEmpty {
                                        noteName = "Untitled note"
                                        noNoteNameAlertShown = true
                                    } else {
                                        // Close popover if no alerts are shown
                                        createNotePopoverShown = false
                                    }

                                    let note = Note(name: noteName, data: noteContents)
                                    print(note)
                                    notes.add(note: note)

                                    // Clear buffers
                                    noteName = ""
                                    noteContents = ""
                                }
                            }
                        }
                }

                // No name alert
                .alert(
                    "No note name entered", isPresented: $noNoteNameAlertShown,
                    actions: {
                        Button("OK") {
                            createNotePopoverShown = false
                            noNoteNameAlertShown = false
                        }
                    },
                    message: { Text("Defaulting to 'Untitled note'") }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
