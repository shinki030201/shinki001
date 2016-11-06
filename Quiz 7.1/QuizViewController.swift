//
//  QuizViewController.swift
//  Quiz 7.1
//
//  Created by 前田直己 on 2016/05/15.
//  Copyright © 2016年 前田直己. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [AnyObject]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [AnyObject]()
        
        tmpArray.append(["能登空港の滑走路の長さは何メートル？","2000m","2500m","3000m",1])
        tmpArray.append(["2006年に能登空港が迎えた節目はなんでしょう","選択肢","選択肢2","選択肢３",1])
        tmpArray.append(["問題文3","選択肢","選択肢２","選択肢３",1])
        tmpArray.append(["飛行機が離陸してから出発地の空港に引き返す事を何と言うでしょう","RTB","ATB","FTB",2])
        tmpArray.append(["能登空港が開港したのは何年でしょう","2000年","2003年","2006年",2])
        tmpArray.append(["問題文6","選択肢","選択肢２","選択肢３",3])
        tmpArray.append(["問題文7","選択肢","選択肢２","選択肢３",3])

        
        srand(UInt32(time(nil)))
        while (tmpArray.count > 0) {
            let index = Int(rand()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.removeAtIndex(index)
        }
        choiceQuize()
    }
    
    func choiceQuize() {
        
        quizTextView.text = quizArray[0][0] as! String
        
        choiceButton1.setTitle(quizArray[0][1] as? String, forState: .Normal)
        choiceButton2.setTitle(quizArray[0][2] as? String, forState: .Normal)
        choiceButton3.setTitle(quizArray[0][3] as? String, forState: .Normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.removeAtIndex(0)
        
        if quizArray.count == 2 {
            performSegueToResult()
        } else {
            choiceQuize()
        }
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destinationViewController as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
