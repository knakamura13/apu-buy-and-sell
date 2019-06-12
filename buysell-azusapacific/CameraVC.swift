//
//  CameraVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/21/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

class CameraVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CreateItemVCDelegate {
    
    var selectedImage: UIImage! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if selectedImage != nil {
            performSegue(withIdentifier: "createItemSegue", sender: self)
        }
    }
    
    @IBAction func takePhotoTapped(_ sender: Any) {
        captureImage()
    }
    @IBAction func takePhotoTapped2(_ sender: Any) {
        captureImage()
    }
    
    @IBAction func uploadPhotoTapped(_ sender: Any) {
        uploadImage()
    }
    @IBAction func uploadPhotoTapped2(_ sender: Any) {
        uploadImage()
    }
    
    func captureImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    func uploadImage() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!){
        selectedImage = image
        self.dismiss(animated: true, completion: nil);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let CreateItemVC = segue.destination as? CreateItemVC {
            CreateItemVC.delegate = self
        }
    }
}

// For sending data to next VC
protocol CreateItemVCDelegate: class {
    var selectedImage: UIImage! { get }
}
