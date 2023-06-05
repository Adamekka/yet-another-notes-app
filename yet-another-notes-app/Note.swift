//
//  Note.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 31.05.2023.
//

import Foundation

/// Note struct representing a single note that user can create and save data in it
struct Note: Codable, Identifiable {
    var id: UUID = UUID()
    var name: String
    var dateCreated: Date = Date()
    var dateEdited: Date = Date()
    var data: String

    init(name: String, data: String) {
        self.name = name
        self.data = data
    }
}
