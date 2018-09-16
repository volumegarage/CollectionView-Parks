//
//  SectionHeader.swift
//  CollectionView
//
//  Created by David Cate on 9/16/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    @IBOutlet private weak var titleLabel: UILabel!
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
        
}
