//
//  settingViewController.swift
//  Lab01
//
//  Created by Admin on 11/20/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class settingViewController: UIViewController {
    
    @IBOutlet var btnGeneration: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnClicked(_ sender: UIButton) {
            if sender.alpha == 1 {
                sender.alpha = 0.3
            }
            else {
                sender.alpha = 1
            }
        
    }
    
    @IBAction func back_Clicked(_ sender: AnyObject) {
        navigationController?.popViewController(animated: true)
    }
    
    
}
