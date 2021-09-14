//
//  TabBarController.swift
//  REater
//
//  Created by Boris Sobolev on 12.09.2021.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        tabBar.backgroundColor = .clear
    }
}
