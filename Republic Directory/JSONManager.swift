//
//  JSONManager.swift
//  Republic Directory
//
//  Created by Patrick Mayo  on 6/20/22.
//

import Foundation
import UIKit

extension Bundle {
    func decode<T: Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) in the project!")
        }
        let decoder = JSONDecoder()
        do {
            let loadedData = try decoder.decode(T.self, from: data)
            return loadedData
        } catch {
            print(error)
        }
        fatalError("Fatal error with \(file). Exiting app.")
    }
}

struct Person: Codable, Hashable {
    let individuals: [Individual]
    static let thePerson: Person = Bundle.main.decode(file: "directory.json")
}

struct Individual: Codable, Hashable, Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var birthdate: String
    var profilePicture: String
    var forceSensitive: Bool
    var affiliation: String
    var lastModified: String
}
