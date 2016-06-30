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
        
        if let audioPlayer = getAVAudioPlayer(audioFile) {
            avPlayer = audioPlayer
            avPlayer.prepareToPlay()
            avPlayer.play()
        }
    }
    
    // Helper function to create an AVAudioPlayer
    func getAVAudioPlayer(fileName: String) -> AVAudioPlayer? {
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
        
        return audioPlayer
    }
    
}

