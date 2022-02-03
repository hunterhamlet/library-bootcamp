//
//  BaseUIViewController.swift
//  Library
//
//  Created by Hamon on 31/01/22.
//

import Foundation
import UIKit

open class BaseUIViewController: UIViewController {
    
    lazy var width : CGFloat = UIScreen.main.bounds.width
    lazy var height : CGFloat = UIScreen.main.bounds.height
    
    lazy var middleWidth : CGFloat = width / 2
    lazy var middleHeight : CGFloat = height / 2
    
    lazy var margin : CGFloat = 16
    
    lazy var grid = width / 12
    
    lazy var titleFont = "Marker Felt Wide"
    
    open override func viewDidLoad() {
        view.backgroundColor = .secondarySystemBackground
    }

    func moveTo(screen: UIViewController, showStyle: UIModalPresentationStyle = .automatic) {
        screen.modalPresentationStyle = showStyle
        present(screen, animated: true)
    }
    
}
