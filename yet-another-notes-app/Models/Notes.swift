//
//  Notes.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 05.06.2023.
//

import Foundation

final class Notes: Codable {
    var notes: [Note]

    init() {
        self.notes =
            UserDefaults.standard.load(key: DefaultKeys.NOTES_KEY, obj: Notes.self)?.notes
            ?? [Note]()
        notes.forEach { print("Note loader: \($0.name)") }
    }

    init(notes: [Note]) {
        self.notes = notes
    }

    func saveNotesToUserDefaults() {
        UserDefaults.standard.save(key: DefaultKeys.NOTES_KEY, obj: self)
    }

    func addNote(note: Note) {
        notes.append(note)
        saveNotesToUserDefaults()
    }
}
