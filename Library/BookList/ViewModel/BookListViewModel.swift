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
        getData()
    }

    private func getData() {
        apiProvider.getBooks(apiResultDelegate: self)
    }

}

extension BookListViewModel: APIResultDelegate {

    func success(data: BooksModel) {
        print("response in view model: \(data)")
        let result = data as BooksModel
        bookListDelegate?.success(bookData: result)
    }

    func error(error: String) {
        bookListDelegate?.error(message: error)
    }
}