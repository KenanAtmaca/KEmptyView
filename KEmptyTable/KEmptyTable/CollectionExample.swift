//
//  CollectionExample.swift
//  KEmptyTable
//
//  Created by Kenan Atmaca on 24.07.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit
import KEmptyView

class CollectionExample: UIViewController {

    @IBOutlet weak var testCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptyView = KEmptyView()
        emptyView.setImageCustomize(image: UIImage(named: "cloud1")!)
        emptyView.animation = .shake
        emptyView.isTapScreen = true
        emptyView.isActionButtonShow = false
        emptyView.screenTapAction = {
            print("zaaaaa")
        }
        testCollection.emptyView = emptyView
        testCollection.reloadEmptyAnimation()

    }
}

extension CollectionExample: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCell", for: indexPath)
        cell.backgroundColor = .orange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
}
