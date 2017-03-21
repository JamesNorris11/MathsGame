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
    @IBOutlet weak var apple1: DraggedImageView!
    @IBOutlet weak var apple2: DraggedImageView!
    @IBOutlet weak var apple3: DraggedImageView!
    @IBOutlet weak var apple4: DraggedImageView!
    @IBOutlet weak var apple5: DraggedImageView!
    @IBOutlet weak var apple6: DraggedImageView!
    @IBOutlet weak var apple7: DraggedImageView!
    @IBOutlet weak var apple8: DraggedImageView!
    @IBOutlet weak var apple9: DraggedImageView!
    
    // For counting questions done
    var qDone = 0
    // Set questions and answers
    var firstNo:[Int] =  [3, 2, 2, 1, 0, 4, 3, 0, 5, 0, 6, 3, 8, 2]
    var secondNo:[Int] = [1, 7, 2, 5, 3, 4, 2, 1, 4, 0, 2, 4, 1, 0]
    var answers:[Int] =  [4, 9, 4, 6, 3, 8, 5, 1, 9, 0, 8, 7, 9, 2]
    
    var apple1Pos = CGPoint()
    var apple2Pos = CGPoint()
    var apple3Pos = CGPoint()
    var apple4Pos = CGPoint()
    var apple5Pos = CGPoint()
    var apple6Pos = CGPoint()
    var apple7Pos = CGPoint()
    var apple8Pos = CGPoint()
    var apple9Pos = CGPoint()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        question.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " = ?"
        
        congratulationsScreen.hidden = true
        
        playBackgroundMusic("Hide & Seek.mp3")
        
        // rotate star images on congratulations screen
        rotateStars()
        
        // save original apple positions
        apple1Pos = apple1.frame.origin
        apple2Pos = apple2.frame.origin
        apple3Pos = apple3.frame.origin
        apple4Pos = apple4.frame.origin
        apple5Pos = apple5.frame.origin
        apple6Pos = apple6.frame.origin
        apple7Pos = apple7.frame.origin
        apple8Pos = apple8.frame.origin
        apple9Pos = apple9.frame.origin
        
        // Change font size of labels by a ratio based on screen size height pixels
        let newFontSize = congratulationsScreen.bounds.size.height / 8
        question.font = question.font.fontWithSize(newFontSize)
        correctAns.font = question.font.fontWithSize(newFontSize)
    }
    
    // For when the replay button is clicked
    @IBAction func replayButton(sender: UIButton) {
        
        // Check if there are more questions left
        if (qDone + 1) > answers.count {
            qDone = 0
        }
        
        // Display question on the screen
        question.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " = ?"
        congratulationsScreen.hidden = true
        
        resetApples()
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
        self.question.textColor = UIColor.redColor()
        UIView.animateWithDuration(0.3, animations: {() -> Void in
            self.question.alpha = 0.0
            },
                                   completion: { finished in
                                    UIView.animateWithDuration(0.3, animations: {
                                        self.question.alpha = 1.0
                                        self.question.textColor = UIColor.blackColor()
                                    })
        })
                self.question.textColor = UIColor.redColor()
    }
    
    // reset Apples to their original positions on the plate
    func resetApples() {
        apple1.frame = CGRect(origin: apple1Pos, size: apple1.frame.size)
        apple2.frame = CGRect(origin: apple2Pos, size: apple2.frame.size)
        apple3.frame = CGRect(origin: apple3Pos, size: apple3.frame.size)
        apple4.frame = CGRect(origin: apple4Pos, size: apple4.frame.size)
        apple5.frame = CGRect(origin: apple5Pos, size: apple5.frame.size)
        apple6.frame = CGRect(origin: apple6Pos, size: apple6.frame.size)
        apple7.frame = CGRect(origin: apple7Pos, size: apple7.frame.size)
        apple8.frame = CGRect(origin: apple8Pos, size: apple8.frame.size)
        apple9.frame = CGRect(origin: apple9Pos, size: apple9.frame.size)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

