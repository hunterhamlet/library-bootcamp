//
//  BooksExtensions.swift
//  Library
//
//  Created by Hamon on 26/03/22.
//

import Foundation

extension Book: Viewable {
    var name: String {
        return self.attributes.title
    }
    var dataType: DataType {
        return .Book
    }
    
    var slug: String? {
        return self.attributes.slug
    }
    
    var content: String? {
        return self.attributes.content
    }
}
