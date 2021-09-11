//
//  FriendsViewController.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//


import UIKit

class FriendsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FriendsTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "FriendsTableViewCellReuseIndentifier")
    }
    

}


extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Storage.allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier, for: indexPath) as! FriendsTableViewCell
        cell.configure(friendName: Storage.allUsers[indexPath.row].name, friendAvatar: Storage.allUsers[indexPath.row].avatar)
        return cell
    }
}
