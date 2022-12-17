//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes=["Soft":300,"Medium":420,"Hard":720]
    var totalTime = 0
    var secondsPassed = 0
    var timer=Timer()
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
       
        timer.invalidate()
        progressBar.progress = 0.0
        secondsPassed = 0
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        label.text = hardness 
         timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer(){
        if secondsPassed < totalTime {
            secondsPassed += 1
            let procentageProgress = Float(secondsPassed) / Float(totalTime)
            progressBar.progress = procentageProgress
            
        }
        else{
            timer.invalidate()
            label.text = "Done"
        }
    }
}
