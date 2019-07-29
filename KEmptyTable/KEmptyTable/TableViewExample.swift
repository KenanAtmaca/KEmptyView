//
//  ViewController.swift
//  KEmptyTable
//
//  Created by Kenan Atmaca on 23.07.2019.
//  Copyright © 2019 Kenan Atmaca. All rights reserved.
//

import UIKit
import KEmptyView

class TableViewExample: UIViewController {

    @IBOutlet weak var testTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let emptyView = KEmptyView()
        emptyView.setImageCustomize(image: UIImage(named: "empty") ?? UIImage())
        emptyView.setTitleCustomize(title: "There were no results", textColor: .gray, font: UIFont(name: "Futura", size: 19))
        emptyView.setButtonCustomize(title: nil, titleColor: .black, image: UIImage(named: "reload"), backgroundColor: nil, font: UIFont(name: "Helvatica", size: 16), overlay: nil)
        emptyView.position = .center
        emptyView.animationDuration = 0.7
        emptyView.animation = .scale
        emptyView.isImageShow = true
        emptyView.isTitleShow = true
        emptyView.isTapScreen = true
        emptyView.isActionButtonShow = true
        
        emptyView.screenTapAction = {
            print("Tap Tap!")
        }
        emptyView.buttonAction = {
            print("Reload!")
        }
        
        testTable.emptyView = emptyView
        emptyView.setImageSize(size: .large)
        
        testTable.reloadEmpty() // non-animated use
      //testTable.reloadEmptyAnimation() // if you are going to use animated
    }
}

extension TableViewExample: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = " >> KEmptyView << "
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}


