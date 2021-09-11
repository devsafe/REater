//
//  PlacesTableViewCell.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    
    static let identifier = "PlacesTableViewCellReuseIndentifier"
    
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
        let bgColorView = UIView()
        bgColorView.backgroundColor = UIColor.clear
        selectedBackgroundView = bgColorView
    }
}
