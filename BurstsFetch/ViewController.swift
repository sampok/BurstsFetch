//
//  ViewController.swift
//  BurstsFetch
//
//  Created by Sampo Karjalainen on 6/19/16.
//  Copyright © 2016 Sampo Karjalainen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var animImageView: UIImageView!
    
    var testImages: [UIImage?] = []
    var currentFrame: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let bm = BurstsManager()
        let burstIds = bm.getAllBursts()
        let oneBurst = burstIds[0]
        let imageSize = CGSize(width: 320, height: 480)
        bm.getBurstImages(oneBurst, size: imageSize, contentMode: .AspectFit) { (images) in
            self.testImages = images
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        delay(3) {
            NSTimer.scheduledTimerWithTimeInterval(
                0.05,
                target: self,
                selector: #selector(self.animate),
                userInfo: nil,
                repeats: true
            )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animate() {
        animImageView.image = testImages[currentFrame]
        currentFrame += 1
        if currentFrame >= testImages.count {
            currentFrame = 0
        }
    }
    
}

