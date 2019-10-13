//
//  Scanner.swift
//  doggo
//
//  Created by Ng Jing Kang on 12/10/19.
//  Copyright © 2019 Ng Jing Kang. All rights reserved.
//

import UIKit
import Lottie
import CoreML
import Vision

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
    
    //let model = MobileNetV2()
    let model = doggoml_1()
    @IBOutlet weak var Breed: UILabel!
    
    
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
        Breed.text = ""
        
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
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
            guard let ciimage = CIImage(image: pickedImage) else {
                fatalError("Error creating CIImage")
            }
            scanImage(image: ciimage)
        }
        dismiss(animated: true, completion: nil)
    }
    
    func scanImage(image: CIImage) {
        guard let model = try? VNCoreMLModel(for: model.model) else {
            fatalError("Error getting Model")
            }
        let request = VNCoreMLRequest(model: model) { (request, error) in
            guard let results = request.results as? [VNClassificationObservation] else {
                fatalError("Results not processed")
        }
            print(results)
            if let resultImage = results.first {
                let splitter = resultImage.identifier.components(separatedBy: ",")
                self.Breed.text = splitter[0]
            }

        }
        let handler = VNImageRequestHandler(ciImage: image)
        do {
            try handler.perform([request])
        } catch {
            print(error)
        }
    }
    
}

