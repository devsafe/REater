//
//  PlacesViewController.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class PlacesViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "PlacesTableViewCellReuseIndentifier")
    }
    

}


extension PlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Storage.allPlaces.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: PlacesTableViewCell.identifier, for: indexPath) as! PlacesTableViewCell
        cell.configure(placeName: Storage.allPlaces[indexPath.row].name, placeLogo: Storage.allPlaces[indexPath.row].logo)
        return cell
    }
}
