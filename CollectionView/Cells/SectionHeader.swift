//
//  SectionHeader.swift
//  CollectionView
//
//  Created by David Cate on 9/16/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    
    // Add Two New Outlets for Section Header Display Work
    @IBOutlet private weak var flagImage: UIImageView!
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    var section: Section! { // Replaced title label with following
    //    var title: String? {
        didSet {
    //            titleLabel.text = title
            titleLabel.text = section.title
            
            // New
            flagImage.image = UIImage(named: section.title ?? "")
            countLabel.text = "\(section.count)"
        }
    }
        
}
