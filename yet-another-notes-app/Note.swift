//
//  Note.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import Foundation

struct Note {
    var name: String
    let dateCreated: Date = Date()
    var dateEdited: Date = Date()
    var data: String

    init(name: String, data: String) {
        self.name = name
        self.data = data
    }
}
