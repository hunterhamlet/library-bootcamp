//
//  CategoryExtensions.swift
//  Library
//
//  Created by Hamon on 26/03/22.
//

import Foundation

extension Category: Viewable {
    var slug: String? {
        return nil
    }
    
    var name: String {
        return self.attributes.name
    }
    var dataType: DataType {
        return .Category
    }
    
    var content: String? {
        return nil
    }
}
