//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTime = ["Soft":30,"Medium":40,"Hard":70]
    @IBAction func hardnessSelected(_ sender: UIButton) {
        selected(a: sender.currentTitle ?? "Soft")
    }
    var player : AVAudioPlayer!
    var time : Int!
    var timer = Timer()
    var type = "Soft"
    func selected(a:String)
    {
        type = a
        timer.invalidate()
        time = eggTime[a]
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    @objc func updateTimer()
    {
        if time>0
        {
            message.text = "\(time ?? 30) seconds ."
            progressBar.progress = 1 - (Float(time)/Float(eggTime[type]!))
            time -= 1
        }
        else
        {
            timer.invalidate()
            message.text = "Your egg is now \(type) ."
            progressBar.progress = 1.0
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
