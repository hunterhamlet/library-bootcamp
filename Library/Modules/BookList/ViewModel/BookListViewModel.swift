//
// Created by Hamon on 08/02/22.
//

import Foundation

class BookListViewModel {

    private let apiProvider = ApiProvider()
    weak var apiProviderDelegate : APIResultDelegate?
    weak var bookListDelegate: BookListDelegate?

    init(delegate: BookListDelegate) {
        bookListDelegate = delegate
        getBooks()
    }

    func getBooks() {
        apiProvider.performRequest(endpoint: .books){ [weak self] (response: BooksResponse) in
            self?.bookListDelegate?.successBooks(bookData: response)
        } onError: { [weak self] error in
            self?.bookListDelegate?.error(message: "no hay datos")
        }
    }
    
    func getAuthors() {
        apiProvider.performRequest(endpoint: .authors){ [weak self] (response: AuthorsResponse) in
            self?.bookListDelegate?.successAuthors(authorData: response)
        } onError: { [weak self] error in
            self?.bookListDelegate?.error(message: "no hay datos")
        }
    }
    
    func getCategories() {
        apiProvider.performRequest(endpoint: .categories){ [weak self] (response: CategoriesResponse) in
            self?.bookListDelegate?.successCategories(categoriesResponse: response)
        } onError: { [weak self] error in
            self?.bookListDelegate?.error(message: "no hay datos")
        }
    }

}
