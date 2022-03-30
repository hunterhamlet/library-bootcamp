//
//  AuthorResponseExtensions.swift
//  Library
//
//  Created by Hamon on 26/03/22.
//

import Foundation

extension Authors: Viewable {
    
    var slug: String? {
        return nil
    }
    
    var name: String {
        return self.attributes.name
    }
    var dataType: DataType {
        return .Author
    }
    
    var content: String? {
        return nil
    }
}
