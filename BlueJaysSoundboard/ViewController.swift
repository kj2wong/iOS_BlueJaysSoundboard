//
//  ViewController.swift
//  BlueJaysSoundboard
//
//  Created by Kevin Wong on 2016-06-28.
//  Copyright © 2016 Kevin Wong. All rights reserved.
//

import AVFoundation
import UIKit

class ViewController: UIViewController {
    
    // Constants
    let MP3 = "mp3"
    let AUDIO_FILE_NAMES = ["1swingAndADrive",
                            "2getUpBall",
                            "3goodbyeHomeRun",
                            "4batFlip",
                            "5encarnacionSong",
                            "6kawasaki",
                            "7lilLooper",
                            "8forgetAboutThisOne",
                            "9ballgame",
                            "10bangers",
                            "11OKBlueJays",
                            "12touchEmAllJoe"]
    
    // Variables
    var avPlayer: AVAudioPlayer!
    
    // MARK: Properties
    @IBOutlet weak var randomButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background colour of app
        self.view.backgroundColor = UIColor(
            red:0,
            green:35/255.0,
            blue:85/255.0,
            alpha:1.0)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Change status bar color
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    // Keep device in portrait mode
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    // Keep device in portrait mode
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    // MARK: Actions
    @IBAction func playRandomSound(sender: UIButton) {
        // Generate a random soundbite to play
        let audioFileNumber = arc4random_uniform(UInt32(AUDIO_FILE_NAMES.count))
        let audioFile = AUDIO_FILE_NAMES[Int(audioFileNumber)]
        
        playAudio(audioFile)
    }
    
    @IBAction func playButton1(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[0])
    }
    
    @IBAction func playButton2(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[1])
    }
    
    @IBAction func playButton3(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[2])
    }
    
    @IBAction func playButton4(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[3])
    }
    
    @IBAction func playButton5(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[4])
    }
    
    @IBAction func playButton6(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[5])
    }
    
    @IBAction func playButton7(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[6])
    }
    
    @IBAction func playButton8(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[7])
    }
    
    @IBAction func playButton9(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[8])
    }
    
    @IBAction func playButton10(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[9])
    }
    
    @IBAction func playButton11(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[10])
    }
    
    @IBAction func playButton12(sender: AnyObject) {
        playAudio(AUDIO_FILE_NAMES[11])
    }
    
    // Helper function to create an AVAudioPlayer
    func playAudio(fileName: String) {
        var audioPlayer: AVAudioPlayer?
        let url = NSURL.fileURLWithPath(
            NSBundle.mainBundle().pathForResource(
                fileName,
                ofType: MP3)!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOfURL: url)
        } catch {
            print ("Could not create audio player.")
        }
        
        if let sound = audioPlayer {
            avPlayer = sound
            avPlayer.prepareToPlay()
            avPlayer.play()
        }
    }
    
}

