//
//  FriendsTableViewCell.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    static let identifier = "FriendsTableViewCellReuseIndentifier"
    
    @IBOutlet var placeNameLabelOutlet: UILabel!
    @IBOutlet var logoImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCellStaticApperance()
        
    }
    
    func configure(placeName: String?, placeLogo: String) {
        //imageChannelsCell.image = UIImage(named: imageName ?? "logo-default")
        placeNameLabelOutlet.text = placeName
        logoImage.image = UIImage(named: placeLogo)
    }
    
    func configureCellStaticApperance() {
        self.backgroundColor = .clear
        selectedBackgroundView?.backgroundColor = .gray
    }
}
