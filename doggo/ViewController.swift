//
//  ViewController.swift
//  doggo
//
//  Created by Ng Jing Kang on 12/10/19.
//  Copyright © 2019 Ng Jing Kang. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    let model = MobileNetV2()
    @IBAction func Camera(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func PhotoLibrary(_ sender: UIBarButtonItem) {
    }
    @IBOutlet var animationView: AnimationView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startAnimation()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainPage")
            self.show(secondViewController!, sender: nil)
        }
    }
    
   func startAnimation() {
        let animation = Animation.named("4888-dog-icon")
        animationView.animation = animation
        animationView.loopMode = .repeat(3)
        animationView.play()
    }

}

