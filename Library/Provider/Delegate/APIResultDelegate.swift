//
// Created by Hamon on 10/02/22.
//

import Foundation

protocol APIResultDelegate: AnyObject {
    func success(data: BooksResponse)
    func error(error: String)
}
