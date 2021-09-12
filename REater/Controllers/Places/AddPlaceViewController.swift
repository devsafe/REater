//
//  AddPlaceViewController.swift
//  REater
//
//  Created by Boris Sobolev on 12.09.2021.
//

import UIKit

class AddPlaceViewController: UIViewController {
    @IBOutlet var placeImage: UIImageView!
    @IBOutlet var placeNameTextField: UITextField!
    @IBOutlet var selectImageFromGallery: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        print("hello add places")
    }
    
    @IBAction func addPlaceButtonPressed(_ sender: UIButton) {
        let newPlaceToAdd = PlaceModel(name: placeNameTextField.text!, type: "fastfood", logo: "default", location: "Moscow")
        Storage.allPlaces.append(newPlaceToAdd)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        self.dismiss(animated: true) {
            
        }
    }
    @IBAction func selectImageFromGalleryPressed(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true) {
          print("imagePicker presented")
        }
    }

}


extension AddPlaceViewController: UIImagePickerControllerDelegate {
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
   // print("UIImagePickerController didFinishPickingMediaWithInfo.")
    info.keys.forEach {
      let key: UIImagePickerController.InfoKey = $0
      let val = info[$0] ?? ""
     // print("info[\(key.rawValue)] = \(val)")
    }

    let originalImage: UIImage? = info[.originalImage] as? UIImage
    placeImage.image = originalImage
    picker.dismiss(animated: true) {
    //  print("dismissed UIImagePickerController.")
    }
  }

  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
   // print("UIImagePickerController canceled.")
    picker.dismiss(animated: true) {
      print("dismissed UIImagePickerController.")
    }
  }
}

extension AddPlaceViewController: UINavigationControllerDelegate {}
