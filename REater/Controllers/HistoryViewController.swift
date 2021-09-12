//
//  HistoryViewController.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "HistoryTableViewCellReuseIndentifier")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }
    

}


extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Storage.history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as! HistoryTableViewCell
        cell.configure(placeName: Storage.history[indexPath.row].place.name, placeLogo: Storage.history[indexPath.row].place.logo, date: Storage.history[indexPath.row].date)
        return cell
    }
}
