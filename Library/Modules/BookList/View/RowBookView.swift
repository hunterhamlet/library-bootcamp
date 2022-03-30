//
// Created by Hamon on 09/03/22.
//

import Foundation
import UIKit

class RowBookView: UITableViewCell {

    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    private let lTitleRow: UILabel = UILabel()
    
    private var title: String = ""

    init(title: String) {
        super.init(style: .default, reuseIdentifier: nil)
        self.title = title
        initUI()
    }


    private func initUI() {
        self.addSubview(lTitleRow)
        lTitleRow.addAnchorsAndSize(width: nil, height: 60, left: 16, top: nil, right: 16, bottom: nil, withAnchor: nil, relativeToView: nil)
        lTitleRow.text = title
        lTitleRow.applyCustomFont()
        lTitleRow.textColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
