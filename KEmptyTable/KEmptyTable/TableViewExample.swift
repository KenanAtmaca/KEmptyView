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
        emptyView.setImageCustomize(image: UIImage(named: "cloud1")!)
        emptyView.setTitleCustomize(title: "Oooops :(")
        emptyView.position = .center
        emptyView.animationDuration = 0.7
        emptyView.animation = .scale
        emptyView.isImageShow = true
        emptyView.isTitleShow = true
        emptyView.isTapScreen = true
        emptyView.screenTapAction = {
            print("Bom!")
        }
        emptyView.buttonAction = {
            print("Reload!")
        }
        testTable.emptyView = emptyView
        testTable.reloadEmptyAnimation()
    }
}

extension TableViewExample: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "KEmptyView"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
}


