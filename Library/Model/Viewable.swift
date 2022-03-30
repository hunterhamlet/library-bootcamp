//
//  Viewable.swift
//  Library
//
//  Created by Hamon on 26/03/22.
//

import Foundation

protocol Viewable {
    var name: String { get }
    var id: String { get }
    var dataType: DataType { get }
    var slug: String? { get }
    var content: String? { get }
}
