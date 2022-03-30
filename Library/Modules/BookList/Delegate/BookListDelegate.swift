//
// Created by Hamon on 08/02/22.
//

import Foundation

protocol BookListDelegate: AnyObject {
    func successBooks(bookData: BooksResponse)
    func successAuthors(authorData: AuthorsResponse)
    func successCategories(categoriesResponse: CategoriesResponse)
    func error(message: String)
}
