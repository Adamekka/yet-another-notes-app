//
//  Note.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import Foundation

struct Note {
    var name: String
    let dateCreated: Date
    var dateEdited: Date
    var data: String

    func new(name: String, data: String) -> Note {
        return Note(
            name: name,
            dateCreated: Date(),
            dateEdited: Date(),
            data: data
        )
    }
}
