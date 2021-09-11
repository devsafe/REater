//
//  GoViewController.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class GoViewController: UIViewController {
    
    @IBOutlet var goButton: UIButton!
    @IBOutlet var resultDestinationPlaceLabel: UILabel!
    @IBOutlet var resultDestinationLogoImage: UIImageView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        goButton.backgroundColor = .systemPink
        goButton.layer.cornerRadius = 8
        activityIndicator.hidesWhenStopped = true
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {

        goButtonAnimate()
        activityIndicator.startAnimating()
        clearResultDestination()
    }
    
    
    @IBAction func goButtonAnimate() {
        
      UIView.animate(withDuration: 2.5, delay: 0.0, usingSpringWithDamping: 0.2,
        initialSpringVelocity: 0.0,
        animations: {
          self.goButton.bounds.size.width += 10.0
           // self.goButton.layer.cornerRadius = 25
            //self.goButton.layer.cornerRadius += 25
        },
        completion: {_ in
            self.getResultDestination()
            self.activityIndicator.stopAnimating()
        }
      )

      UIView.animate(withDuration: 0.33, delay: 0.0, usingSpringWithDamping: 0.7,
        initialSpringVelocity: 0.0,
        animations: {
         // self.goButton.center.y += 60.0
//          self.spinner.center = CGPoint(x: 40.0, y: self.loginButton.frame.size.height/2)
//          self.spinner.alpha = 1.0
            
        },
        completion: nil
      )

      let tintColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
      //tintBackgroundColor(layer: goButton.layer, toColor: tintColor)
      //roundCorners(layer: goButton.layer, toRadius: 25.0)
        goButton.layer.cornerRadius = 25
    }
    
    
    func getResultDestination() {
        let resultIndex = Int.random(in: 0..<Storage.allPlaces.count)
        resultDestinationPlaceLabel.text = Storage.allPlaces[resultIndex].name
        resultDestinationLogoImage.image = UIImage(named: Storage.allPlaces[resultIndex].logo)
    }
    
    func clearResultDestination() {
        resultDestinationLogoImage.image = nil
        resultDestinationPlaceLabel.text = nil
    }
}
