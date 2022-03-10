//
// Created by Hamon on 08/02/22.
//

import Foundation

protocol BookListDelegate: AnyObject {
    func success(bookData: BooksModel)
    func error(message: String)
}
