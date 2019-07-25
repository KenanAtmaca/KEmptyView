//
//  UITableView+.swift
//  KEmptyView
//
//  Created by Kenan Atmaca on 25.07.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit

extension UITableView {
    
    private struct EmptyKey {
        static var stateKey:String = "com.KEmptyViewTable.stateKey"
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
        guard let tableEmptyView = self.emptyView, isTableEmpty() else { return }
        self.isScrollEnabled = false
        self.separatorStyle = .none
        self.backgroundView = tableEmptyView
    }
    
    public func reloadEmptyAnimation() {
        reloadEmpty()
        if let view = self.emptyView as? KEmptyView {
            view.showAnimation()
        }
    }
    
    private func isTableEmpty() -> Bool {
        let sectionCount = self.numberOfSections
        var rowCount = 0
        for i in 0..<sectionCount {
            rowCount += self.numberOfRows(inSection: i)
        }
        return rowCount == 0
    }
}
