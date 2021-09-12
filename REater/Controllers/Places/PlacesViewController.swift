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
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        tableView.register(UINib(nibName: "PlacesTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "PlacesTableViewCellReuseIndentifier")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    @objc private func reloadPlacesList(notification: NSNotification)
       {
           tableView.reloadData()
           self.view.setNeedsDisplay()
       }
    
    @objc func loadList(notification: NSNotification){
        print("reloadList")
        tableView.reloadData()
        //tabBar.items![1].badgeValue = String(Storage.allUsers[Storage.userIdActiveSession].favGroups.count)
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
