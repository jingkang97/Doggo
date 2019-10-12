//
//  Scanner.swift
//  doggo
//
//  Created by Ng Jing Kang on 12/10/19.
//  Copyright © 2019 Ng Jing Kang. All rights reserved.
//

import UIKit
import Lottie
class Scanner :UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet var animationView: AnimationView!
    func startAnimation() {
        let animation = Animation.named("8414-lottie-doggie (1)")
        animationView.animation = animation
        animationView.loopMode = .loop
        animationView.play()
    }
    
    let imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet var PhotoLibrary: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        imagePicker.delegate = self
    }
    @IBAction func photoLibraryTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
}

