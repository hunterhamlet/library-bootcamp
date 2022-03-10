//
// Created by Hamon on 08/02/22.
//

import Foundation

import Foundation

// MARK: - Welcome
struct BooksData: Codable {
    let data: [DatumData?]
}

// MARK: - Datum
struct DatumData: Codable {
    let type, id: String
    //let attributes: AttributesData
    //let relationships: RelationshipsData
    //let links: DatumLinksData
}

// MARK: - Attributes
struct AttributesData: Codable {
    let title, slug, content: String
    let createdAt, updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case title, slug, content
        case createdAt = "created-at"
        case updatedAt = "updated-at"
    }
}

// MARK: - DatumLinks
struct DatumLinksData: Codable {
    let linksSelf: String

    enum CodingKeysData: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - Relationships
struct RelationshipsData: Codable {
    let authors, categories: AuthorsData
}

// MARK: - Authors
struct AuthorsData: Codable {
    let links: AuthorsLinksData
}

// MARK: - AuthorsLinks
struct AuthorsLinksData: Codable {
    let linksSelf, related: String

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case related
    }
}