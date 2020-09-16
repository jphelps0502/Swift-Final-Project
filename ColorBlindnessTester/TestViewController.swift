//
//  TestViewController.swift
//  ColorBlindnessTester
//
//  Created by Christa Phelps on 5/6/20.
//  Copyright © 2020 Christa Phelps. All rights reserved.
//

import UIKit
class TestViewController: UIViewController {
    
    
    @IBOutlet weak var testImageView: UIImageView!
    
    @IBOutlet weak var userAnswerInput: UITextField!
    
    @IBOutlet weak var userScoreLabel: UILabel!
    

    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var testTabItem: UITabBarItem!
    var imageList = ["3","5","7","8","15","29","45","57","73","74"]
    var score = 0
    var currentImageIndex = 0
    var correctCount = 0
    var questionNumberCount = 0
    
    
    
    @IBAction func submitAnswer(_ sender: UIButton) {
    questionNumberCount=(questionNumberCount + 1)
        if questionNumberCount <= imageList.count{
            var userAnswer: String = userAnswerInput.text!
            if userAnswer == imageList[currentImageIndex]{
                correctCount = (correctCount + 1)
                updateScore()
                userAnswerInput.text = nil
               
            }else{
                goToNextImage()
                updateScore()
            }
            goToNextImage()
        } else{            
            if score >= 60{
                resultLabel.text = "You Passed!"
                resultLabel.textColor = UIColor.green
            }else if score < 60{
                resultLabel.text = "You Failed."
                resultLabel.textColor = UIColor.red
            }
        }
    }
    
    //update the textImageView
    func updateImage(){
        //userAnswerInput.text = nil;
        let imageName = imageList[currentImageIndex]
        let image = UIImage(named: imageName)
        testImageView.image = image
    }
    
    //go to next image in imageList
    func goToNextImage() {
        currentImageIndex += 1
        if currentImageIndex >= imageList.count{
                currentImageIndex = 0
        }
            updateImage()
        }
    //update the score
    func updateScore(){
        score = (correctCount * 100 / questionNumberCount)
        var scoreString = String(score)
        userScoreLabel.text = String(scoreString + "%")
    }
   
    
    //reset inputs, score, questionNumberCount, correctCount, resultLabel. Then shuffle imageList and updateImage
    @IBAction func resetButton(_ sender: Any) {
        imageList.shuffle()
        updateImage()
        userScoreLabel.text = "0%"
        correctCount = 0
        questionNumberCount = 0
        resultLabel.text = nil
        userAnswerInput.text = nil
    }
    
    override func viewDidLoad() {
        updateImage()
        testImageView.layer.borderWidth = 3
        userAnswerInput.layer.borderWidth = 2
        testTabItem.imageInsets = UIEdgeInsets(top: 6,left: 0,bottom: -6,right: 0)
    }
}
