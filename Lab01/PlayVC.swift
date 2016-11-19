//
//  PlayVC.swift
//  Lab01
//
//  Created by Admin on 11/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = UIImage(named: "Yveltal.png")?.withRenderingMode(.alwaysTemplate)
        imageView.layer.cornerRadius = 5;
        button1.layer.cornerRadius = 15;
        button2.layer.cornerRadius = 15;
        button3.layer.cornerRadius = 15;
        button4.layer.cornerRadius = 15;
        
        button1.setTitle("Dung", for: .normal)
        button2.setTitle("Sai", for: .normal)
        button3.setTitle("Sai", for: .normal)
        button4.setTitle("Sai", for: .normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var score:Int = 0

    var answer:String = "Dung"
    
    @IBAction func back_Clicked(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn1_Clicked(_ sender: AnyObject) {
        if button1.titleLabel!.text == answer {
            button1.backgroundColor = UIColor.green
            increaseScore()
        }
        else {
            button1.backgroundColor = UIColor.red
        }
        displayAnswer()
        lblScore.text = String(score)
    }
    
    @IBAction func btn2_Clicked(_ sender: AnyObject) {
        if button2.titleLabel!.text == answer {
            button2.backgroundColor = UIColor.green
            increaseScore()
        }
        else {
            button2.backgroundColor = UIColor.red
            
        }
        displayAnswer()
        lblScore.text = String(score)
    }
    
    @IBAction func btn3_Clicked(_ sender: AnyObject) {
        if button3.titleLabel!.text == answer {
            button3.backgroundColor = UIColor.green
            increaseScore()
        }
        else {
            button3.backgroundColor = UIColor.red
            
        }
        displayAnswer()
        lblScore.text = String(score)
    }
    
    @IBAction func btn4_Clicked(_ sender: AnyObject) {
        if button4.titleLabel!.text == answer {
            button4.backgroundColor = UIColor.green
            increaseScore()
        }
        else {
            button4.backgroundColor = UIColor.red
            
        }
        displayAnswer()
        lblScore.text = String(score)
    }
    
    
    func displayAnswer() {
                imageView.image = UIImage(named: "Yveltal.png")?.withRenderingMode(.alwaysOriginal)
        
        if button1.titleLabel!.text == answer {
            button1.backgroundColor = UIColor.green
        } else if button2.titleLabel!.text == answer {
            button2.backgroundColor = UIColor.green
        } else if button3.titleLabel!.text == answer {
            button3.backgroundColor = UIColor.green
        } else {
            button4.backgroundColor = UIColor.green
        }
    }
    
    func increaseScore() {
        score += 1
    }
}
