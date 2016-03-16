//
//  ViewController.swift
//  whereToEat
//
//  Created by 马腾 on 16/3/15.
//  Copyright © 2016年 马腾. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer:NSTimer?
    enum  Choice {
        case eat,drive
    }
    
    @IBOutlet weak var dice1view: UIImageView!
    
    @IBOutlet weak var dice2view: UIImageView!
    
    @IBOutlet weak var dice3view: UIImageView!
    
    
    @IBOutlet weak var carResault: UILabel!
    @IBOutlet weak var resault: UILabel!
    var dice1num = 0
    var dice2num = 0
    var dice3num = 0
    var choice = Choice.eat
    
    var imageNumber = 0
    func judgeResault(){
        switch choice {
        case .eat:
        if dice1num + dice2num + dice3num <= 6 {
            self.resault.text = "一点利"
            
        }else if dice1num + dice2num + dice3num > 6 && dice1num + dice2num + dice3num <= 12{
            self.resault.text = "郭文华炒面"
        }else{
            self.resault.text = "苏氏拉面"
        }
        
        case .drive:
            
            if (Double)(dice1num + dice2num + dice3num) * 0.7 <= 9 {
                self.carResault.text = "马腾"
            }else{
                self.carResault.text = "王猛"
            }
        default:
            break
        }
    }
    func changeImage() {
        
        let i1 = arc4random()%6 + 1
        var name = "骰子" + String(i1) + ".png"
        var image = UIImage(named: name)
        dice1num = (Int)(i1)
        dice1view.image = image
        
        let i2 = arc4random()%6 + 1
         name = "骰子" + String(i2) + ".png"
         image = UIImage(named: name)
        dice2num = (Int)(i2)
        dice2view.image = image
        
        let i3 = arc4random()%6 + 1
         name = "骰子" + String(i3) + ".png"
         image = UIImage(named: name)
        dice3num = (Int)(i3)
        dice3view.image = image
        
        
        imageNumber++
        if imageNumber > 20 {
            timer?.invalidate()
            imageNumber = 0
            judgeResault()
        
        }
    }
    
    
    @IBAction func whoDriveCar(sender: UIButton) {
        choice = .drive
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,selector: "changeImage", userInfo: nil,repeats: true)
        
    }
    
    
    @IBAction func startDice(sender: UIButton) {
        choice = .eat
        timer?.invalidate()
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self,selector: "changeImage", userInfo: nil,repeats: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

