//
//  ViewController.swift
//  ThumbnailViewFromExternalVideoURL
//
//  Created by ADMIN on 02/05/20.
//  Copyright © 2020 Success Resource Pte Ltd. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    let url = URL(string: "Your video url")
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let thumbnailImage = getThumbnailImage(forUrl: url!) {
            imageView.image = thumbnailImage
        }
    }

    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60) , actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }
        return nil
    }

}

