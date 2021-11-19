//
//  ViewController.swift
//  StoppurApp
//
//  Created by Nureddin Elmas on 2021-11-18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTimeLabel: UILabel!
   
    
    
    let formatter = DateFormatter()
    var timer : Timer?
    
    let startTime = 60.0
    
    var player1time = 0.0
    var player2time = 0.0
    
    var player1active = true
    
    var lastTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }



 
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if timer != nil {
            switchPlayer()
        } else {
            startClock()
        }
    }
    
    func switchPlayer(){
        player1active.toggle()
        updateTime()
    }


    func resetPlayerTime(){
        player1time = startTime
        player2time = startTime
    }
    
    func startClock(){
        resetPlayerTime()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateTime(timer:))
        lastTime = Date()
    }
    
    func updateTime(timer: Timer? = nil){
        let newTime = Date()
        let deltaTime = newTime.timeIntervalSince(lastTime)
        
        if player1active {
            player1time -= deltaTime
        }else{
            player2time -= deltaTime
        }
        updateTimeLabel()
        
        if player2time < 0 || player1time < 0 {
            timer?.invalidate()
        }
        
        lastTime = newTime
    }
    
   
    
    
   func updateTimeLabel (){
        let newTimeLabel = "\(String(format: "%.1f", player1time))   :   \(String(format: "%.1f", player2time))"
       
       firstTimeLabel.text = newTimeLabel
    }
    
    deinit{
        timer?.invalidate()
    }
}

