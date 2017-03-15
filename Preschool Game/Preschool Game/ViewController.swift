//
//  ViewController.swift
//  Preschool Game
//
//  Created by jn12abd on 20/02/2017.
//  Copyright © 2017 jn12abd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var congratulationsScreen: UIView!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var correctAns: UILabel!
    
    var qDone = 0
    var firstNo:[Int] =  [3, 2, 2, 1, 0, 4, 3]
    var secondNo:[Int] = [1, 7, 2, 5, 3, 4, 2]
    var answers:[Int] =  [4, 9, 4, 6, 3, 8, 5]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        congratulationsScreen.hidden = true
        
    }
    
    @IBAction func replayButton(sender: UIButton) {
        
        // Check if there are more questions left
        if (qDone + 1) > answers.count {
            // no more questions left
        }
        else {
            question.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " ="
            congratulationsScreen.hidden = true
        }
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
    
    func isCorrect(ans: Int) {
        if ans == answers[qDone] {
            // correct answer - congrats screen view
            
            congratulationsScreen.hidden = false
            
            correctAns.text = String(firstNo[qDone]) + " + " + String(secondNo[qDone]) + " = " + String(answers[qDone])
            
            qDone = qDone + 1
        }
        else {
            // incorrect answer - make question mark flash red
            
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

