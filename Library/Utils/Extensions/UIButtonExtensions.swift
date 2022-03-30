//
// Created by Hamon on 01/02/22.
//

import Foundation
import UIKit

extension UIButton {

    func applyStyle(color: UIColor = .blue, textColor: UIColor = UIColor.white) {
        self.backgroundColor = color
        self.setTitleColor(textColor, for: .normal)
        self.layer.cornerRadius = 5
    }

}