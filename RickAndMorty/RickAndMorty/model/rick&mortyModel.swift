// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome2 = try Welcome2(json)

import Foundation

// MARK: - Welcome2
struct Welcome2 : Codable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info : Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, type, dimension: String?
    let residents: [String]?
    let url: String?
    let created: String?
    
    init(id: Int?, name: String?, type: String?, dimension: String?, residents: [String]?, url: String?, created: String?) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
}

