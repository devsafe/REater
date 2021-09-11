//
//  FriendsTableViewCell.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCellReuseIndentifier"
    
    @IBOutlet var friendAvatarImage: UIImageView!
    @IBOutlet var friendNameLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCellStaticApperance()
        
    }
    
    func configure(friendName: String?, friendAvatar: String) {
        //imageChannelsCell.image = UIImage(named: imageName ?? "logo-default")
        friendNameLabel.text = friendName
        friendAvatarImage.image = UIImage(named: friendAvatar)
    }
    
    func configureCellStaticApperance() {
        self.backgroundColor = .clear
        selectedBackgroundView?.backgroundColor = .gray
        friendAvatarImage.layer.cornerRadius = friendAvatarImage.bounds.size.width / 2
        
    }
}
