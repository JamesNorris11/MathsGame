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
    
    var qDone = 0;
    var answer = 4
    var firstNo:[Int] =  [3, 2, 2, 1, 0, 4, 3]
    var secondNo:[Int] = [1, 7, 2, 5, 3, 4, 2]
    var answers:[Int] =  [4, 9, 4, 6, 3, 8, 5]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //congratulationsScreen.hidden = true;
        congratulationsScreen.hidden = false;
        
    }
    
    @IBAction func replayButton(sender: UIButton) {
        question.text = "4 + 9 = ?"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

}

