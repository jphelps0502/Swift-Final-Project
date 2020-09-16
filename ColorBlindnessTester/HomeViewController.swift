//
//  HomeViewController.swift
//  ColorBlindnessTester
//
//  Created by Christa Phelps on 5/6/20.
//  Copyright © 2020 Christa Phelps. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    var sunglassesImages: [UIImage] = []
    
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var UserNameInput: UITextField!
    
    @IBOutlet weak var homeTabItem: UITabBarItem!
    
    @IBOutlet weak var greetingsLabel: UILabel!
    // get user's name from UserNameInput and update greetingsLabel
    @IBAction func SubmitName(_ sender: UIButton) {
        let text: String = UserNameInput.text!
        UserNameInput.text = nil
        greetingsLabel.text = "Welcome \(text)!\n Click the Test icon \n to begin the test!"   
        
    }// end SubmitName
    
    //create an array of images for the GIF
    func createGifArray(total: Int, prefix: String) -> [UIImage]{
        var imgArray:[UIImage] = []
        for imageCount in 0..<total{
            let imageName = "\(prefix)-\(imageCount)"
            let image = UIImage(named:imageName)!
            imgArray.append(image)
        }
        return imgArray
    }// end createGifArray
    
    //animate the array of images of GIF
    func animate(imageView: UIImageView, images:[UIImage]){
        imageView.animationImages = images
        imageView.animationDuration = 2.0
        imageView.startAnimating()
    }//end animate
    
    override func viewDidLoad() {
        sunglassesImages = createGifArray(total: 29, prefix: "sunglasses")
        animate(imageView: ImageView, images: sunglassesImages)
        homeTabItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
    }
    
    
}//end class

