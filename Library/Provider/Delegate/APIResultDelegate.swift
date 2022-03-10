//
// Created by Hamon on 10/02/22.
//

import Foundation

protocol APIResultDelegate: AnyObject {
    func success(data: BooksModel)
    func error(error: String)
}