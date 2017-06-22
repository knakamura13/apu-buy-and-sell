//
//  CameraVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/21/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var pickedImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func cameraButtonAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func photoLibraryAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func saveButtonAction(_ sender: Any) {
        let imageData = UIImageJPEGRepresentation(pickedImage.image!, 0.6)
        let compressdJPEGImage = UIImage(data: imageData!)
        UIImageWriteToSavedPhotosAlbum(compressdJPEGImage!, nil, nil, nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        pickedImage.image = image
        self.dismiss(animated: true, completion: nil);
    }
}
