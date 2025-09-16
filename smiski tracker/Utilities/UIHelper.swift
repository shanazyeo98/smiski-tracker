//
//  UIHelper.swift
//  smiski tracker
//
//  Created by Shanaz Yeo on 16/9/25.
//

import UIKit

struct UIHelper {
    static func createTwoColumnFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
        let width = view.bounds.width
        let padding: CGFloat = 12
        let minimumItemSpacing: CGFloat = 15
        let availableWidth = width - (padding * 2) - minimumItemSpacing
        let itemWidth = availableWidth / 2
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        return flowLayout
    }
}
