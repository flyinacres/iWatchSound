//
//  InterfaceController.swift
//  Adding Sound WatchKit Extension
//
//  Created by Ronald Fischer on 10/6/15.
//  Copyright (c) 2015 qpiapps. All rights reserved.
//

import WatchKit
import Foundation
import AVFoundation


class InterfaceController: WKInterfaceController {

    enum AudioPlayState {
        case On
        case Off
    }
    var audioPlayer = AVAudioPlayer()
    var playState = AudioPlayState.Off

    @IBOutlet weak var buttonLabel: WKInterfaceButton!
    
    @IBAction func volumeVal(value: Float) {
        if playState == AudioPlayState.On {
            audioPlayer.volume = value
            println("Audio volume \(value)")
        }
    }
    
    
    @IBAction func buttonPressed() {

        if playState == AudioPlayState.Off {
            playState = AudioPlayState.On
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            buttonLabel.setTitle("Stop")
        } else {
            playState = AudioPlayState.Off
            audioPlayer.stop()
            buttonLabel.setTitle("Start")
            // This is effectively a 'pause' command, 
            // unless I do: audioPlayer.currentTime = 0
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var soundPath = NSBundle.mainBundle().pathForResource("jcbach-17-6-1-hjlee", ofType: "mp3")
        var soundPathURL = NSURL(fileURLWithPath: soundPath!)
        
        var error:NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: soundPathURL, error: &error)
        audioPlayer.volume = 0.2


    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
