//
//  GoViewController.swift
//  REater
//
//  Created by Boris Sobolev on 11.09.2021.
//

import UIKit

class GoViewController: UIViewController {
    
    @IBOutlet var backGroundView: UIView!
    @IBOutlet var backGroundImageView: UIImageView!
    @IBOutlet var goButton: UIButton!
    @IBOutlet var resultDestinationPlaceLabel: UILabel!
    @IBOutlet var resultDestinationLogoImage: UIImageView!
    @IBOutlet var goButtonLabel: UILabel!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    var currentPlace = PlaceModel(name: "Where", type: "fastfood", logo: "default", location: "default")
    var selectedPhoto = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBlur()
        backGroundImageView.image = nil
        //view.delegate = self
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        goButton.backgroundColor = .systemGreen
        goButton.layer.cornerRadius = 8
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .systemBackground
       goButtonLabel.text = "GO"
        self.view.backgroundColor = .systemPink
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //backGroundImageView.
        backGroundView.layer.removeAllAnimations()
        //shakeAnimation(animateview: backGroundImageView)
        rotateAnimation(backGroundImageView)
        shakeAnimation2(animateview: backGroundView)
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        
        if !checkIsAlreadyGetResultToday() {
            //goButtonLabel.text = "SEARCHING"
           // resultDestinationLogoImage.alpha = 0
            //resultDestinationPlaceLabel.alpha = 0
            //backGroundImageView.alpha = 0
            getResultDestination()
            goButtonAnimate()
            activityIndicator.startAnimating()
            
            
            //clearResultDestination()
           // goButtonLabel.text = "SEARCHING"
          //  scaleAnimation(goButton)
            
            //goButtonLabel.rotate360Degrees()

            
            Storage.history.append(HistoryModel(date: Date(), place: currentPlace, isGoing: false))
        } else {
            print("error")
        }
        

        
    }
    
    func checkIsAlreadyGetResultToday() -> Bool {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let dateString = formatter.string(from: Date())
        let dateString2 = formatter.string(from: Storage.history.last?.date ?? Date())
        
        if dateString == dateString2 {
            return false
        }
        return false
    }
    
    
    func addBlur() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backGroundImageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        backGroundImageView.addSubview(blurEffectView)
    }
    
    @IBAction func goButtonAnimate() {
        
        UIView.animateKeyframes(
            withDuration: 2.7,
            delay: 0,
            options: [],
            animations: { [self] in
                let originalColorButton = goButton.backgroundColor
                let originalWidhtButton = goButton.bounds.size.width
                let originalHeightButton = goButton.bounds.size.height
                
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.backgroundColor = .systemBlue
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.layer.cornerRadius = goButton.bounds.height / 2
                                    //goButton.alpha = 0.6
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.bounds.size.width = goButton.bounds.height
                                   goButton.bounds.size.height = goButton.bounds.height
                                    goButtonLabel.alpha = 0
                                    activityIndicator.alpha = 1
                                   // backGroundImageView.alpha = 0
                                   // goButtonLabel.text = "SEARCHING"
                                   })
                
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.3,
                                   animations: {
                                    goButton.alpha = 1
                                    goButton.bounds.size.width = goButton.bounds.height * 30
                                   goButton.bounds.size.height = goButton.bounds.height * 30
                                    goButton.layer.cornerRadius = goButton.bounds.height / 2
                                   // goButtonLabel.text = "SEARCHING"
                                   })
                
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.1,
                                   animations: {
                                    //goButton.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.backgroundColor = originalColorButton
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.transform = .identity
                                   // goButton.setTitle("r4r4", for: .normal)
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.bounds.size.width = originalWidhtButton
                                    goButton.bounds.size.height = originalHeightButton
                                    goButtonLabel.alpha = 1
                                    activityIndicator.alpha = 0
                                    resultDestinationLogoImage.alpha = 1
                                    resultDestinationPlaceLabel.alpha = 1
                                    backGroundImageView.alpha = 1
                                    UIView.animate(withDuration: 0.15, delay: 3, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                                    }, completion: {_ in
                                        //activityIndicator.stopAnimating()
                                        print("ddd")
                                    })
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.1,
                                   animations: {
                                   // goButton.bounds.size.height = originalHeightButton
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                   relativeDuration: 0.1,
                                   animations: {
                                    goButton.layer.cornerRadius = 8
                                   })
                
                UIView.addKeyframe(withRelativeStartTime: 0,
                                                   relativeDuration: 0.1,
                                                   animations: {
                                                    //self.goButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
                                                    //goButtonLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
                                                    //rotateAnimation(goButtonLabel)
                                                    //self.goButton.transform = .identity
                                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.9,
                                                   relativeDuration: 0.1,
                                                   animations: {
                                                    //self.goButton.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
                                                    //goButtonLabel.transform = CGAffineTransform(rotationAngle: 0)
                                                    //self.goButton.transform = .identity
                                                   })
            },
            completion: { [self]_ in
                
                
                goButtonLabel.layer.removeAllAnimations()
                //animateResultAppear()
               // goButtonLabel.text = "GO"
            }
        )
    }
    
    
    func animateResultAppear() {
        UIView.animateKeyframes(
            withDuration: 3,
            delay: 0,
            options: [],
            animations: { [self] in
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.1,
                                   animations: {
                                    resultDestinationLogoImage.alpha = 0
                                    resultDestinationPlaceLabel.alpha = 0
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.5,
                                   animations: {
                                    resultDestinationLogoImage.alpha = 1
                                    resultDestinationPlaceLabel.alpha = 1
                                   })
            },
            completion: { [self]_ in
               // goButtonLabel.text = "GO"
               
            }
        )
    }
    
    func shakeAnimation(animateview: UIView) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 5
        animation.repeatCount = .infinity
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: animateview.center.x - 50, y: animateview.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: animateview.center.x + 50, y: animateview.center.y))
        
        animateview.layer.add(animation, forKey: "position")
    }
    
    
    func shakeAnimation2(animateview: UIView) {
        UIView.animateKeyframes(
            withDuration: 6,
            delay: 0,
            options: [.repeat, .autoreverse],
            animations: { [self] in
                UIView.addKeyframe(withRelativeStartTime: 0,
                                   relativeDuration: 0.5,
                                   animations: {
                                    animateview.transform = CGAffineTransform(translationX: -30, y: 0)
                                   })
                UIView.addKeyframe(withRelativeStartTime: 0.5,
                                   relativeDuration: 0.5,
                                   animations: {
                                    animateview.transform = CGAffineTransform(translationX: 30, y: 0)
                                   })
            },
            completion: { [self]_ in
               // goButtonLabel.text = "GO"
               
            }
        )
       
    }
    
    
    func getResultDestination() {
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) { [self] in
            let resultIndex = Int.random(in: 0..<Storage.allPlaces.count)
            resultDestinationPlaceLabel.text = Storage.allPlaces[resultIndex].name
            resultDestinationLogoImage.image = UIImage(named: Storage.allPlaces[resultIndex].logo)
            backGroundImageView.image = UIImage(named: Storage.allPlaces[resultIndex].logo)
            currentPlace = Storage.allPlaces[resultIndex]
        }
    }
    
    func clearResultDestination() {
        resultDestinationLogoImage.image = nil
        resultDestinationPlaceLabel.text = nil
    }
    
    func scaleAnimation(_ viewToAnimate: UIView) {
        UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewToAnimate.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.15, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewToAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}

func rotateAnimation(_ viewToAnimate: UIView) {
    UIView.animate(withDuration: 4, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: [.curveEaseIn, .repeat, .autoreverse], animations: {
        viewToAnimate.transform = CGAffineTransform(rotationAngle: .pi / 150)
    }) { (_) in
        UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 1, options: .repeat, animations: {
           // viewToAnimate.transform = .identity
            viewToAnimate.transform = CGAffineTransform(rotationAngle: -.pi / 150)
        }, completion: nil)
    }
}



extension UIView {
    func rotate360Degrees(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 14)
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount=Float.infinity
        self.layer.add(rotateAnimation, forKey: nil)
    }
}
