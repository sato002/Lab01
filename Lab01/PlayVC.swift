//
//  PlayVC.swift
//  Lab01
//
//  Created by Admin on 11/17/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class PlayVC: UIViewController {
    
    @IBOutlet weak var progressRP: RPCircularProgress!
    
    @IBOutlet var btnCollection: [UIButton]!
    

    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    var score:Int = 0
    var answer:String?
    var pokemon1:[pokemon]?
    var pokemon2:[pokemon]?
    var pokemon3:[pokemon]?
    var pokemon4:[pokemon]?
    var imageString:String?
    var timer = Timer()
    
    func pickerPokemon() {
        pokemon1 = DataManager.defautManager.selectAllStudent()
        
        
        repeat{
        pokemon2 = DataManager.defautManager.selectAllStudent()
        } while (pokemon2?[0].name == pokemon1?[0].name)
        
        repeat{
            pokemon3 = DataManager.defautManager.selectAllStudent()
        } while (pokemon3?[0].name == pokemon1?[0].name || pokemon3?[0].name == pokemon2?[0].name)
        
        repeat{
            pokemon4 = DataManager.defautManager.selectAllStudent()
        } while (pokemon4?[0].name == pokemon1?[0].name || pokemon4?[0].name == pokemon2?[0].name || pokemon4?[0].name == pokemon3?[0].name)
        
        let num:Int = Int(arc4random_uniform(3))
        if num == 0 {
            answer = pokemon1?[0].name
            imageString = pokemon1?[0].image
        } else if num == 1 {
            answer = pokemon2?[0].name
            imageString = pokemon2?[0].image
        } else if num == 2 {
            answer = pokemon3?[0].name
            imageString = pokemon3?[0].image
        } else if num == 3 {
            answer = pokemon4?[0].name
            imageString = pokemon4?[0].image
        }
        imageView.tintColor = UIColor.black
        self.imageView.image = UIImage(named: self.imageString!)?.withRenderingMode(.alwaysTemplate)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerPokemon()
        setUI()
    }
    
    func setUI() {
        
        self.progressRP.updateProgress(1, animated: true, initialDelay: 0, duration: 10) {
            
        }
        imageView.layer.cornerRadius = 5;
        
        btnCollection[0].setTitle(pokemon1?[0].name, for: .normal)
        btnCollection[1].setTitle(pokemon2?[0].name, for: .normal)
        btnCollection[2].setTitle(pokemon3?[0].name, for: .normal)
        btnCollection[3].setTitle(pokemon4?[0].name, for: .normal)
        
        for button in btnCollection {
            button.isUserInteractionEnabled = true
            button.backgroundColor = UIColor.white
        }
        
    }
    
    func displayAnswer() {
        self.imageView.image = UIImage(named: self.imageString!)?.withRenderingMode(.alwaysOriginal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func back_Clicked(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func btnClicked(_ sender: UIButton) {
        displayAnswer()
        if sender.titleLabel?.text != answer {
            sender.backgroundColor = UIColor.red
        } else {
            score += 1
            lblScore.text = String(score)

        }
        
        for button in btnCollection {
            if button.titleLabel?.text == answer {
                button.backgroundColor = UIColor.green
            }
            button.isUserInteractionEnabled = false
        }
        
        
        nextQuiz()

    }
    
    func nextQuiz() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.pickerPokemon()
            self.setUI()
            
        }
    }
    
}
