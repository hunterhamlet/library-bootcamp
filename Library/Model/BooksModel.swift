//
// Created by Hamon on 08/02/22.
//
import Foundation

// MARK: - Welcome
struct BooksModel {
    let data: [DatumModel?]
}

// MARK: - Datum
struct DatumModel {
    let type, id: String
    //let attributes: AttributesModel?
    //let relationships: RelationshipsModel
    //let links: DatumLinksModel
}

// MARK: - Attributes
struct AttributesModel {
    let title, slug, content: String
    let createdAt, updatedAt: Date
}

// MARK: - DatumLinks
struct DatumLinksModel{
    let linksSelf: String
}

// MARK: - Relationships
struct RelationshipsModel {
    let authors, categories: AuthorsModel
}

// MARK: - Authors
struct AuthorsModel{
    let links: AuthorsLinksModel
}

// MARK: - AuthorsLinks
struct AuthorsLinksModel{
    let linksSelf, related: String
}
