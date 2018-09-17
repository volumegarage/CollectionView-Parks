//
//  FlowLayout.swift
//  CollectionView
//
//  Created by David Cate on 9/17/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import UIKit

class FlowLayout: UICollectionViewFlowLayout {
    
    // Add Item Property to keep track of any new items being added.
    var addedItem: IndexPath?
    // Pass value when add button is clicked
    
    var deletedItems: [IndexPath]?
    
    
    // Now here are the delete functions
    
    override func finalLayoutAttributesForDisappearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.finalLayoutAttributesForDisappearingItem(at: itemIndexPath),
        let deleted = deletedItems,
            deleted.contains(itemIndexPath) else {
                return nil
        }
        
        // Scale Down and disappear in place
        attributes.alpha = 1.0
        attributes.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        attributes.zIndex = -1
        
        return attributes
        
    }
        
    
    // Adding Border
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? { // Returns value for rectangle
        var result = [UICollectionViewLayoutAttributes]()
        
        // Get attrributes for all cells
        if let attributes = super.layoutAttributesForElements(in: rect) {
            for item in attributes {
                let cellAttributres = item.copy() as! UICollectionViewLayoutAttributes
                if item.representedElementKind == nil { // Get all item cells
                    let frame = cellAttributres.frame
                    cellAttributres.frame = frame.insetBy(dx: 2.0, dy: 2.0) // Set elements for frame
                }
                result.append(cellAttributres)
            }
        }
        
        return result
    }
    
 
    
    // Now override methond we discussed for changing flow layout property
    
    override func initialLayoutAttributesForAppearingItem(at itemIndexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        guard let attributes = super.initialLayoutAttributesForAppearingItem(at: itemIndexPath),
        let added = addedItem, // Check to see if item was added
            added == itemIndexPath else { // Check to see if index is added
                return nil
        }
        
        // set new attributes
        attributes.center = CGPoint(x: collectionView!.frame.width - 23.5, y: -24.5)
        attributes.alpha = 1.0
        attributes.transform = CGAffineTransform(scaleX: 0.15, y: 0.15)
        attributes.zIndex = 5
        
        return attributes
    }
    

}
