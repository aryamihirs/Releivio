//
//  ViewController.swift
//  Insights
//
//  Created by Maybe Not on 2022/11/10.
//

import UIKit


class ViewController: UIViewController {
    


//Give the specific advice
    
    // text of advice for perfect status
    let level_perfect:String = "Perfect!\nYou are in a good condition, keep it up and maintain your good living habits!"
    // text of advice for good status
    let level_good:String = "Your stress level is good!\nYou can do better! Try meditating /taking a nap for 30 minutes, it may help you feel better!"
    //text of advice for unhappy status
    let level_unhappy:String = "You seem a little tired and depressed.\nThis may be because you have experienced insomnia, irregular work, rest, etc. Don't worry, do some meditation and rest, and you will get better soon"
    //text of advice for frustrated status
    let level_frustrated:String = "Oh, it looks like you're going through a stressful time.\nYou may be under a lot of pressure and an inappropriate lifestyle. It is not a big problem, just take your time. Try a more regular and healthier lifestyle and take time to meditate and exercise every day. You will get out of the current predicamen"
    
    //insert label mock
    @IBOutlet weak var advice_content: UILabel!
    @IBOutlet weak var advice_title: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //get the stress score
        var stress_score:Int = 81

        //identify the stress score and level
        if (80 <= stress_score) {
            advice_content.text = level_perfect
        }else if (60 <= stress_score) {
            advice_content.text = level_good
        }else if (40 <= stress_score){
            advice_content.text = level_unhappy
        }else if (0 <= stress_score){
            advice_content.text = level_frustrated
        }

    }
 

}

