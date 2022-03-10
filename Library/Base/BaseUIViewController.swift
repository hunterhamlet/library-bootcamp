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

    private lazy var ivBackButton : UIImageView = UIImageView()
    
    open override func viewDidLoad() {
        view.backgroundColor = .secondarySystemBackground
        addBackButton()
    }

    func moveTo(screen: UIViewController, showStyle: UIModalPresentationStyle = .automatic) {
        screen.modalPresentationStyle = showStyle
        present(screen, animated: true)
    }

    private func addBackButton() {
        view.addSubview(ivBackButton)
        ivBackButton.isUserInteractionEnabled = true
        ivBackButton.image = UIImage(named: "ic_back")
        ivBackButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onBackPress)))
        ivBackButton.addAnchorsAndSize(width: grid * 0.6, height: grid * 0.6, left: margin, top: grid * 2, right: nil, bottom: nil)
    }

    func getBackButton() -> UIView {
        return ivBackButton
    }
    
    func hideBackbutton() {
        ivBackButton.isHidden = true
    }

    @objc private func onBackPress() {
        dismiss(animated: true)
    }
    
}
