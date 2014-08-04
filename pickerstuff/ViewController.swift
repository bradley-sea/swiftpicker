//
//  ViewController.swift
//  pickerstuff
//
//  Created by Bradley Johnson on 8/4/14.
//  Copyright (c) 2014 learnswift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker = UIImagePickerController()
    var actionController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imagePicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                self.imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        }
        else {
                  self.imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        
        self.imagePicker.delegate = self
        self.setupActionController()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setupActionController() {
        let cameraOption = UIAlertAction(title: "Take Photo", style: UIAlertActionStyle.Default, handler: {(action : UIAlertAction!) -> Void in
            
            })
        let libraryOption = UIAlertAction(title: "Choose From Library", style: UIAlertActionStyle.Default, handler: {(action : UIAlertAction!) -> Void in
            
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
            })
        
        self.actionController.addAction(cameraOption)
        self.actionController.addAction(libraryOption)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func handlePhotoButtonPressed(sender: AnyObject) {
        self.presentViewController(self.actionController, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]!) {
        
        var image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageView.image = image
        
    }

}

