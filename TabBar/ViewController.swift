//
//  ViewController.swift
//  TabBar
//
//  Created by tami on 9/29/20.
//

import UIKit

class StopWatchViewController: UIViewController {
    // Buttons Outlets
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    // Lables Outlets
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    // Variables
    var hours = 0
    var minutes = 0
    var seconds = 0
    //Timer init
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        stopButton.layer.cornerRadius = stopButton.frame.width / 2
        stopButton.layer.masksToBounds = true
        stopButton.isEnabled = false
        
        pauseButton.layer.cornerRadius = stopButton.frame.width / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        
        playButton.layer.cornerRadius = stopButton.frame.width / 2
        playButton.layer.masksToBounds = true
    }
    
   
    @IBAction func start(_ sender: UIButton) {
        // Starting the Timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = false
        
        
    }
    
    @IBAction func pause(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = true
    }
    
    
    @IBAction func reset(_ sender: UIButton) {
        resetTimer()
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    
    
    @objc fileprivate func count(){
        seconds += 1
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        if minutes == 60 {
            minutes = 0
            seconds = 0
            hours += 1
        }
        if hours == 24 {
            resetTimer()
        }
        if seconds < 10 {
            secondLabel.text = "0\(seconds)"
        }else{
            secondLabel.text = "\(seconds)"
        }
        if minutes < 10 {
            minuteLabel.text = "0\(minutes)"
        }else{
            minuteLabel.text = "\(minutes)"
        }
        
        if hours < 10 {
            hourLabel.text = "0\(hours)"
        }else{
            hourLabel.text = "\(hours)"
        }
    }
    
    func resetTimer(){
        seconds = 0
        minutes = 0
        hours = 0
        timer.invalidate()
        secondLabel.text = "00"
        minuteLabel.text = "00"
        hourLabel.text = "00"
        
    }
    
}

class TimerViewController: UIViewController {

    // Labels
    @IBOutlet weak var secondsLabel: UILabel!
    @IBOutlet weak var minutesLabel: UILabel!
    @IBOutlet weak var hoursLabel: UILabel!
    
    //Buttons
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    //Variables
    var seconds: Int = 0
    var minutes: Int = 0
    var timer = Timer()
    
    // Slider
    
    @IBOutlet weak var slider: UISlider!
    @IBAction func sliderFunc(_ sender: UISlider) {
        sender.minimumValue = 1
        sender.maximumValue = 60
        
        sender.isContinuous = true
        seconds = Int(sender.value)
        if seconds == 60 {
            secondsLabel.text = "00"
            minutesLabel.text = "01"
        }else{
            minutesLabel.text = "00"
            if seconds < 10 {
                secondsLabel.text = "0\(String(seconds))"
            }else{
                secondsLabel.text = String(seconds)
            }
            
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seconds = 30
        
        if seconds == 60 {
            secondsLabel.text = "00"
            minutesLabel.text = "01"
        }else{
            minutesLabel.text = "00"
            if seconds < 10 {
                secondsLabel.text = "0\(String(seconds))"
            }else{
                secondsLabel.text = String(seconds)
            }
            
        }
        
        // Circular Buttons
        stopButton.layer.cornerRadius = stopButton.frame.width / 2
        stopButton.layer.masksToBounds = true
        stopButton.isEnabled = false
        
        pauseButton.layer.cornerRadius = stopButton.frame.width / 2
        pauseButton.layer.masksToBounds = true
        pauseButton.isEnabled = false
        
        playButton.layer.cornerRadius = stopButton.frame.width / 2
        playButton.layer.masksToBounds = true
        
        
    }
    
    

    @IBAction func playButtonAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(count), userInfo: nil, repeats: true)
        slider.isHidden = true
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = false
        
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        timer.invalidate()
        stopButton.isEnabled = true
        pauseButton.isEnabled = true
        playButton.isEnabled = true
    }
    
    @IBAction func stopButtonAction(_ sender: UIButton) {
        slider.isHidden = false
        resetTimer()
        stopButton.isEnabled = false
        pauseButton.isEnabled = false
        playButton.isEnabled = true
    }
    
    
    @objc fileprivate func count(){
        seconds -= 1
        
        if seconds < 1{
            timer.invalidate()
        } else if seconds > 1 && seconds < 10 {
            secondsLabel.text = "0\(seconds)"
        }else if seconds >= 10 && seconds < 60 {
            minutesLabel.text = "00"
            secondsLabel.text = "\(seconds)"
        }
        else {
            secondsLabel.text = "\(seconds)"
        }
    }
    
    func resetTimer(){
        seconds = 0
        timer.invalidate()
        secondsLabel.text = "00"
        minutesLabel.text = "00"
      
    }
}

