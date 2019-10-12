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
    
    static var pugLock : Bool = true
    static var corgiLock : Bool = true
    static var goldenLock : Bool = true
    static var huskyLock : Bool = true
    static var germanLock : Bool = true
    static var frenchLock : Bool = true
    static var malteseLock : Bool = true
    static var labradorLock : Bool = true
    static var pomeranianLock : Bool = true
    static var chihuahuaLock : Bool = true
    static var poodleLock : Bool = true
    static var chowchowLock : Bool = true
    static var boxerLock : Bool = true
    static var shihLock : Bool = true
    static var pekLock : Bool = true
    static var samLock : Bool = true
    static var greatLock : Bool = true
    static var shibaLock : Bool = true
    static var dacLock : Bool = true
    static var parsonLock : Bool = true
    static var dalmatianLock : Bool = true
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        startAnimation()
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

