//
//  UICollectionView+.swift
//  KEmptyView
//
//  Created by Kenan Atmaca on 25.07.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    private struct EmptyKey {
        static var stateKey:String = "com.KEmptyViewCollection.stateKey"
    }
    
    public var emptyView: UIView? {
        get { return objc_getAssociatedObject(self, &EmptyKey.stateKey)  as? UIView }
        set {
            objc_setAssociatedObject(self, &EmptyKey.stateKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            if let view = emptyView as? KEmptyView {
                view.frontViewFrame = self.frame
            }
        }
    }
    
    public func reloadEmpty() {
        self.reloadData()
        guard let tableEmptyView = self.emptyView, isCollectionEmpty() else { return }
        self.isScrollEnabled = false
        self.backgroundView = tableEmptyView
    }
    
    public func reloadEmptyAnimation() {
        reloadEmpty()
        if let view = self.emptyView as? KEmptyView {
            view.showAnimation()
        }
    }
    
    private func isCollectionEmpty() -> Bool {
        let sectionCount = self.numberOfSections
        var itemsCount = 0
        for i in 0..<sectionCount {
            itemsCount += self.numberOfItems(inSection: i)
        }
        return itemsCount == 0
    }
}
