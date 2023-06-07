//
//  UserDefaults.swift
//  yet-another-notes-app
//
//  Created by Adam Cvikl on 07.06.2023.
//

import Foundation

class DefaultKeys {
    static let NOTES_KEY = "NOTES_KEY"
}

extension UserDefaults {
    func save<T: Codable>(key: String, obj: T) {
        do {
            let data = try JSONEncoder().encode(obj)
            self.set(data, forKey: key)
            print("Saved: \(obj.self) to UserDefaults")
        } catch {
            print("Error saving: \(obj.self) to UserDefaults")
            print(error)
        }
    }

    func load<T: Codable>(key: String, obj: T.Type) -> T? {
        do {
            guard let data = self.object(forKey: key) as? Data else { return nil }
            let loadedData = try JSONDecoder().decode(T.self, from: data)
            print("Loaded: \(obj) from UserDefaults")
            return loadedData
        } catch {
            print("Error loading: \(obj.self) fom UserDefaults")
            print(error)
            return nil
        }
    }

    func reset() {
        self.removeObject(forKey: DefaultKeys.NOTES_KEY)
    }
}
