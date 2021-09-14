//
//  HistoryTableViewCell.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCellReuseIndentifier"
    
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var placeNameLabelOutlet: UILabel!
    @IBOutlet var logoImage: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.configureCellStaticApperance()
        
    }
    
    
    
    func configure(placeName: String?, placeLogo: String, date: Date) {
        //imageChannelsCell.image = UIImage(named: imageName ?? "logo-default")
        placeNameLabelOutlet.text = placeName
        logoImage.image = UIImage(named: placeLogo)
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let dateString = formatter.string(from: date)
        
        dateLabel.text = dateString
    }
    
    func configureCellStaticApperance() {
        self.backgroundColor = .clear
        selectedBackgroundView?.backgroundColor = .gray
        logoImage.layer.cornerRadius = 4
    }
}
