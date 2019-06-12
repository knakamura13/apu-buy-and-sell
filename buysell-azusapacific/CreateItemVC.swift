//
//  CreateItemVC.swift
//  buysell-azusapacific
//
//  Created by Kyle Nakamura (Student) on 6/21/17.
//  Copyright © 2017 Kyle Nakamura (Student). All rights reserved.
//

import UIKit

var globalImage: UIImage?

class CreateItemVC: UIViewController, UITextFieldDelegate {
    
    weak var delegate: CreateItemVCDelegate?  // Access selectedItem through `delegate?.`
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    override func viewDidLoad() {
        let helloVar = "var"
        print(helloVar)
        
        super.viewDidLoad()
        titleField.delegate = self
        scrollView.contentSize.height = 1200
        
        // Keyboard observers DO NOT EDIT
        NotificationCenter.default.addObserver(self, selector: #selector(CreateItemVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(CreateItemVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        itemImageView.image = delegate?.selectedImage
    }
    
    // Keyboard functions to move the entire screen when the keyboard is active
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    // Jump from textfield 1 to 2 to 3 then hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == titleField {
            descriptionTextView.becomeFirstResponder()
        } else {
            titleField.resignFirstResponder()
            descriptionTextView.resignFirstResponder()
        }
        return true
    }
}
