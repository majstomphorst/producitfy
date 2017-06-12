//
//  EditPhotoViewController.swift
//  producitfy
//
//  Created by Maxim Stomphorst on 12/06/2017.
//  Copyright © 2017 M.a.j©. All rights reserved.
//

import UIKit

class EditPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func imagePress(_ sender: Any) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.mediaTypes = [kCIAttributeTypeImage as String]
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
        print("taptap")
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        _ = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        print("hello")
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}


