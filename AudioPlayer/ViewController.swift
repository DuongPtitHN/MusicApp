//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Admin on 5/10/17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit
import AVFoundation

var audioPlayer: AVAudioPlayer = AVAudioPlayer()
var isPlaying = false

var timer:Timer?
var timer2:Timer?

class ViewController: UIViewController {

    @IBOutlet weak var labelA: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelB: UILabel!
    @IBAction func stopMusic(_ sender: Any) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        isPlaying = false
    }
    @IBAction func playMusic(_ sender: Any) {
        if isPlaying {
            audioPlayer.pause()
            isPlaying = false
            
        }else{
            audioPlayer.play()
            isPlaying = true
            
             timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelA.text = " Yeu Duoi - Nguyen Hoang Dung"
        
        // Do any additional setup after loading the view, typically from a nib.
        do{
             let audioPath = Bundle.main.path(forResource: "Yeu Duoi", ofType: "mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: audioPath!))
            slider.maximumValue = Float(audioPlayer.duration)
        }
        catch{
            print("error")
        }
       
    }
    @IBAction func Volum(_ sender: UISlider) {
        audioPlayer.stop()
        audioPlayer.currentTime = TimeInterval(slider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    func updateTime() -> Void {
        var currentTime = Int(audioPlayer.currentTime)
        var minutes = currentTime/60
        var seconds = currentTime - minutes * 60
        
        labelB.text = NSString(format: "%02d:%02d", minutes,seconds) as String
        slider.value = Float(audioPlayer.currentTime)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

