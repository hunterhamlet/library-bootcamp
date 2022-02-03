//
// Created by Hamon on 01/02/22.
//

import Foundation
import UIKit

extension UILabel {

    func applyCustomFont(fontSize: CGFloat = 18) {
        self.font = getCustomFont(fontSize: fontSize)
    }
}