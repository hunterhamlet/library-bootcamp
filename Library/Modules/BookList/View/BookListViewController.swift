//
// Created by Hamon on 01/02/22.
//

import Foundation
import UIKit

class BookListViewController: BaseUIViewController {

    private let tvUsername: UILabel = UILabel()
    private let containerCategories: UIView = UIView()
    private let containerFilter: UIView = UIView()
    private let btBooks: UIButton = UIButton()
    private let btCategories: UIButton = UIButton()
    private let btAuthors: UIButton = UIButton()
    private let separatorOne: UIView = UIView()
    private let separatorTwo: UIView = UIView()
    private let bookList: UITableView = UITableView()

    private var viewModel: BookListViewModel?
    private var dataSource: [Viewable] = [Viewable]()

    override func viewDidLoad() {
        super.viewDidLoad()
        hideBackbutton()
        setupUI()
    }

    private func setupUI() {
        setupUserName()
        addCategoriesButton()
        addBokList()
        viewModel = BookListViewModel(delegate: self)
    }

    private func setupUserName() {
        let backButton = getBackButton()
        view.addSubview(tvUsername)
        tvUsername.text = "Hola Hamon"
        tvUsername.applyCustomFont()
        tvUsername.addAnchorsAndSize(width: grid * 5, height: 60, left: margin, top: grid * 1.4, right: nil, bottom: nil, withAnchor: .left, relativeToView: backButton)
    }

    private func addCategoriesButton() {
        view.addSubview(containerFilter)
        containerFilter.backgroundColor = .white
        containerFilter.layer.cornerRadius = 20
        containerFilter.addAnchorsAndSize(width: nil, height: 60, left: margin, top: margin, right: margin, bottom: nil, withAnchor: .top, relativeToView: tvUsername)

        containerFilter.addSubview(btCategories)
        btCategories.setTitle("Categorias", for: .normal)
        btCategories.setTitleColor(.blue, for: .normal)
        btCategories.titleLabel?.font = view.getCustomFont()
        btCategories.addTarget(self, action: #selector(getBookByCategories), for: .touchUpInside)
        btCategories.addAnchorsAndCenter(centerX: true, centerY: true, width: nil, height: nil, left: nil, top: nil, right: nil, bottom: nil)

        containerFilter.addSubview(btBooks)
        btBooks.setTitle("Libros", for: .normal)
        btBooks.setTitleColor(.blue, for: .normal)
        btBooks.titleLabel?.font = view.getCustomFont()
        btBooks.addTarget(self, action: #selector(getBooks), for: .touchUpInside)
        btBooks.addAnchorsAndCenter(centerX: false, centerY: true, width: nil, height: nil, left: margin, top: nil, right: nil, bottom: nil)
        btBooks.addAnchors(left: nil, top: nil, right: margin, bottom: nil, withAnchor: .right, relativeToView: btCategories)

        containerFilter.addSubview(btAuthors)
        btAuthors.setTitle("Autor", for: .normal)
        btAuthors.setTitleColor(.blue, for: .normal)
        btAuthors.titleLabel?.font = view.getCustomFont()
        btAuthors.addTarget(self, action: #selector(getBookByAuthors), for: .touchUpInside)
        btAuthors.addAnchorsAndCenter(centerX: false, centerY: true, width: nil, height: nil, left: nil, top: nil, right: margin, bottom: nil)
        btAuthors.addAnchors(left: margin, top: nil, right: nil, bottom: nil, withAnchor: .left, relativeToView: btCategories)
    }

    private func addBokList() {
        bookList.delegate = self
        bookList.dataSource = self
        view.addSubview(bookList)
        bookList.addAnchorsAndSize(width: nil, height: nil, left: margin, top: margin, right: margin, bottom: margin * 2, withAnchor: .top, relativeToView: containerFilter)
    }

    @objc private func getBookByCategories() {
        viewModel?.getCategories()
    }

    @objc private func getBooks() {
        viewModel?.getBooks()
    }

    @objc private func getBookByAuthors() {
        viewModel?.getAuthors()
    }

}

extension BookListViewController: BookListDelegate {
    
    func successBooks(bookData: BooksResponse) {
        dataSource = bookData.data
        bookList.reloadData()
    }
    
    func successAuthors(authorData: AuthorsResponse){
        dataSource = authorData.data
        bookList.reloadData()
    }
    
    func successCategories(categoriesResponse: CategoriesResponse) {
        print("categories: \(categoriesResponse)")
        dataSource = categoriesResponse.data
        bookList.reloadData()
    }

    func error(message: String) {
        print("error in screen \(message)")
    }
}


extension BookListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
    }

}

extension BookListViewController: UITableViewDataSource {

    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let title = dataSource[indexPath.row].name
        return RowBookView(title: title)
    }

}
