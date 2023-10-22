//
//  rick&mortyModel.swift
//  RickAndMorty
//
//  Created by ismail karaçayır on 22.10.2023.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Location
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String

    struct Location: Codable {
        let name: String
        let url: String
    }
}
