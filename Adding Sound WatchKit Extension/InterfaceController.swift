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

    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var buttonLabel: WKInterfaceButton!
    
    @IBAction func buttonPressed() {
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var soundPath = NSBundle.mainBundle().pathForResource("jcbach-17-6-1-hjlee", ofType: "mp3")
        var soundPathURL = NSURL(fileURLWithPath: soundPath!)
        
        var error:NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: soundPathURL, error: &error)
        audioPlayer.prepareToPlay()
        audioPlayer.play()

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
