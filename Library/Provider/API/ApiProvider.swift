//
// Created by Hamon on 08/02/22.
//

import Foundation

private let BASE_URL = "https://playground-bookstore.herokuapp.com/api/v1"

struct ApiProvider {

    enum APIRequest: String {
        case BOOKS = "/books"
    }

    func getBooks(apiResultDelegate: APIResultDelegate) {
        if let urlBooks = URL(string: "\(BASE_URL)\(APIRequest.BOOKS.rawValue)") {
            let sessions = URLSession(configuration: .default)
            let task = sessions.dataTask(with: urlBooks) { data, response, error in

                if error != nil {
                    apiResultDelegate.error(error: "Hubo un error en nuestros servicios")
                }

                if let data = data {
                    let dataString = String(data: data, encoding: .utf8)
                    if let _booksNotNull = parseBookJSON(booksData: data) {
                        apiResultDelegate.success(data: _booksNotNull)
                    }
                }

            }
            task.resume()
        }
    }

    private func parseBookJSON(booksData: Data) -> BooksModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(BooksData.self, from: booksData)
            let bookListMap = decodedData.data.map { data -> DatumModel? in
                parseDatumJSON(bookData: data)
            }
            let bookList = BooksModel(data: bookListMap)
            return bookList
        } catch {
            return nil
        }
    }

    private func parseDatumJSON(bookData: DatumData?) -> DatumModel? {
        return DatumModel(type: bookData?.type ?? "NONE", id: bookData?.id ?? "NONE")
    }

    private func parseAttributesJSON(bookData: AttributesData) -> AttributesModel? {
        do {
            let book = AttributesModel(title: bookData.title, slug: bookData.slug, content: bookData.content, createdAt: bookData.createdAt, updatedAt: bookData.updatedAt)
            return book

        } catch {
            return nil
        }
    }

}
