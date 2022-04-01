//
//  DetailViewController.swift
//  Library
//
//  Created by Hamon on 31/03/22.
//

import Foundation
import UIKit

class DetailViewController: BaseUIViewController {
    
    private let lDetail: UILabel = UILabel()
    private let lDescriptionTitle: UILabel = UILabel()
    private let lDescription: UILabel = UILabel()
    
    var viewable: Viewable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        
        //add subviews
        view.addSubview(lDetail)
        lDetail.numberOfLines = 0
        lDetail.addAnchorsAndCenter(centerX: true, centerY: false, width: nil, height: nil, left: 16, top: 120, right: 16, bottom: nil)
        
        view.addSubview(lDescriptionTitle)
        lDescriptionTitle.applyCustomFont(fontSize: 24)
        lDescriptionTitle.addAnchorsAndSize(width: nil, height: 60, left: 16, top: 16, right: nil, bottom: nil, withAnchor: .top, relativeToView: lDetail)
        lDescriptionTitle.text = "Descripción"
        
        view.addSubview(lDescription)
        lDescription.text = viewable?.content
        lDescription.numberOfLines = 0
        lDescription.addAnchorsAndSize(width: nil, height: nil, left: 16, top: nil, right: 16, bottom: nil, withAnchor: nil, relativeToView: nil)
        lDescription.addAnchors(left: nil, top: 40, right: nil, bottom: nil, withAnchor: .top, relativeToView: lDescriptionTitle)
        
        if let result = viewable {
            print("viewable: \(result)")
            lDetail.applyCustomFont(fontSize: 20)
            lDetail.text = result.name
        }
    }
    
    private func setupDescription() {
        switch viewable?.dataType {
        case .Book:
            lDescriptionTitle.isHidden = false
            lDescriptionTitle.isHidden = false
        case .Author:
            lDescriptionTitle.isHidden = true
            lDescriptionTitle.isHidden = true
        case .Category:
            lDescriptionTitle.isHidden = true
            lDescriptionTitle.isHidden = true
        default:
            lDescriptionTitle.isHidden = true
            lDescriptionTitle.isHidden = true
        }
    }
    
}
