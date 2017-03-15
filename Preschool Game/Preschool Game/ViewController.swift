//
//  ViewController.swift
//  Preschool Game
//
//  Created by jn12abd on 20/02/2017.
//  Copyright © 2017 jn12abd. All rights reserved.
//

import UIKit

import AVFoundation

var backgroundMusicPlayer = AVAudioPlayer()

func playBackgroundMusic(filename: String) {
    let url = NSBundle.mainBundle().URLForResource(filename, withExtension: nil)
    guard let newURL = url else {
        print("Could not find file: \(filename)")
        return
    }
    do {
        backgroundMusicPlayer = try AVAudioPlayer(contentsOfURL: newURL)
        backgroundMusicPlayer.numberOfLoops = -1
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    } catch let error as NSError {
        print(error.description)
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var congratulationsScreen: UIView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var correctAns: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    @IBOutlet weak var thumb: UIImageView!
    @IBOutlet weak var qMark: UILabel!
    
    // For counting questions done
    var qDone = 0
    // Set questions and answers
    var firstNo:[Int] =  [3, 2, 2, 1, 0, 4, 3, 0, 5, 0, 6, 3, 8, 2]
    var secondNo:[Int] = [1, 7, 2, 5, 3, 4, 2, 1, 4, 0, 2, 4, 1, 0]
    var answers:[Int] =  [4, 9, 4, 6, 3, 8, 5, 1, 9, 0, 8, 7, 9, 2]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        question.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " ="
        
        congratulationsScreen.hidden = true
        
        playBackgroundMusic("Hide & Seek.mp3")
        
        // rotate star images on congratulations screen
        rotateStars()
        
    }
    
    // For when the replay button is clicked
    @IBAction func replayButton(sender: UIButton) {
        
        // Check if there are more questions left
        if (qDone + 1) > answers.count {
            qDone = 0
        }
        
        // Display question on the screen
        question.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " ="
        congratulationsScreen.hidden = true
    }

    @IBAction func ans0(sender: UIButton) {
        isCorrect(0)
    }
    
    @IBAction func ans1(sender: UIButton) {
        isCorrect(1)
    }
    
    @IBAction func ans2(sender: UIButton) {
        isCorrect(2)
    }
    
    @IBAction func ans3(sender: UIButton) {
        isCorrect(3)
    }
    
    @IBAction func ans4(sender: UIButton) {
        isCorrect(4)
    }
    
    @IBAction func ans5(sender: UIButton) {
        isCorrect(5)
    }
    
    @IBAction func ans6(sender: UIButton) {
        isCorrect(6)
    }
    
    @IBAction func ans7(sender: UIButton) {
        isCorrect(7)
    }
    
    @IBAction func ans8(sender: UIButton) {
        isCorrect(8)
    }
    
    @IBAction func ans9(sender: UIButton) {
        isCorrect(9)
    }
    
    // Checks if selected button represents correct answer
    func isCorrect(ans: Int) {
        if ans == answers[qDone] {
            // correct answer - congrats screen view
            
            //show Congrats screen
            congratulationsScreen.hidden = false
            
            // Show question and correct answer on screen
            correctAns.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " = " + String(answers[qDone])
            
            // thumb image bounce animation
            bounceThumb()
            
            // Questions done increased by one
            qDone = qDone + 1
        }
        else {
            // function for wrong answer
            wrongAns()
        }
    }
    
    func rotateStars() {
        
        UIView.animateWithDuration(1.5, delay: 0, options: .CurveLinear, animations: { () -> Void in
            
            self.star1.transform = CGAffineTransformRotate(self.star1.transform, CGFloat(M_PI_2))
            self.star2.transform = CGAffineTransformRotate(self.star2.transform, CGFloat(M_PI_2))
            self.star3.transform = CGAffineTransformRotate(self.star3.transform, CGFloat(M_PI_2))
            self.star4.transform = CGAffineTransformRotate(self.star4.transform, CGFloat(M_PI_2))
            self.star5.transform = CGAffineTransformRotate(self.star5.transform, CGFloat(M_PI_2))
            
        }) { (finished) -> Void in
            self.rotateStars()
        }
    }
    
    // thumb image bounce animation
    func bounceThumb() {
        
        self.thumb.center.y = self.congratulationsScreen.bounds.midY + 90
        
        UIView.animateWithDuration(1, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 20, options: [], animations: {

                self.thumb.center.y = self.congratulationsScreen.bounds.midY - 20
            
            }, completion: nil)
    }
    
    // flash question mark and make it red when wrong answer is selected
    func wrongAns() {
        self.qMark.textColor = UIColor.redColor()
        UIView.animateWithDuration(0.3, animations: {() -> Void in
            self.qMark.alpha = 0.0
            },
                                   completion: { finished in
                                    UIView.animateWithDuration(0.3, animations: {
                                        self.qMark.alpha = 1.0
                                        self.qMark.textColor = UIColor.blackColor()
                                    })
        })
                self.qMark.textColor = UIColor.redColor()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

