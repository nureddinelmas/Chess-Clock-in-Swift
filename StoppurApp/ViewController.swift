//
//  ViewController.swift
//  StoppurApp
//
//  Created by Nureddin Elmas on 2021-11-18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstTimeLabel: UILabel!
    @IBOutlet weak var secondTimeLabel: UILabel!
    
    @IBOutlet weak var secondPlayerButton: UIButton!
    @IBOutlet weak var firstPlayerButton: UIButton!
    
    var countForFirstPlayer = 10
    var numberOfquene = true
    var countForSecondPlayer = 10
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func firstPlayerClicked (){
        
        if numberOfquene {

            if firstPlayerButton.titleLabel?.text == "STOP"{
                numberOfquene = false
                timer.invalidate()
                firstPlayerButton.setTitle("First Player", for: .normal)
                secondPlayerButton.isEnabled = true
                firstPlayerButton.isEnabled = false
            } else if firstPlayerButton.titleLabel?.text == "First Player" {
                secondPlayerButton.isEnabled = false
                firstPlayerButton.setTitle("STOP", for: .normal)
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounterForFirst), userInfo: nil, repeats: true)
            }
        }
       
        
    }
    
    @objc func timerCounterForFirst () -> Void {
        if countForFirstPlayer != 0 {
            countForFirstPlayer = countForFirstPlayer - 1
            firstTimeLabel.text = toString(count: countForFirstPlayer)
        }else{
            countForFirstPlayer = 10
            firstPlayerButton.setTitle("First Player", for: .init())
            secondPlayerButton.setTitle("Second Player", for: .init())
        }
    }
    
    @IBAction func secondPlayerClicked(_ sender: UIButton) {
        if !numberOfquene {
            if secondPlayerButton.titleLabel?.text == "STOP"{
                numberOfquene = true
                timer.invalidate()
                secondPlayerButton.setTitle("Second Player", for: .normal)
                firstPlayerButton.isEnabled = true
                secondPlayerButton.isEnabled = false
            } else if secondPlayerButton.titleLabel?.text == "Second Player" {
                firstPlayerButton.isEnabled = false
                
                secondPlayerButton.setTitle("STOP", for: .normal)
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounterForSecond), userInfo: nil, repeats: true)
            }
        }
        
    }
    
    @objc func timerCounterForSecond () -> Void {
        if countForSecondPlayer != 0 {
            countForSecondPlayer = countForSecondPlayer - 1
            secondTimeLabel.text = toString(count: countForSecondPlayer)
        }else{
            firstPlayerButton.setTitle("First Player", for: .init())
            secondPlayerButton.setTitle("Second Player", for: .init())
        }
    }
    
    
    @IBAction func firstPlayerClicked(_ sender: Any) {
      firstPlayerClicked()
    }
    
    func toString (count : Int) -> String {
        let min : Int = count / 60
        let sec : Int = Int(count % 60)
        return "\(min) : \(sec)"
    }
    
    

}

