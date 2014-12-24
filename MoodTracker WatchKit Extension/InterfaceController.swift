//
//  InterfaceController.swift
//  MoodTracker WatchKit Extension
//
//  Created by Nathan Cope on 12/23/14.
//  Copyright (c) 2014 PlumChoice Inc. All rights reserved.
//

import WatchKit
import Foundation

class MoodContextData {
    let moodIndex: Int
    let showAdvice: Bool
    
    init(moodIndex: Int, showAdvice: Bool){
        self.moodIndex = moodIndex
        self.showAdvice = showAdvice
    }
}

class InterfaceController: WKInterfaceController {
    @IBOutlet weak var moodImage: WKInterfaceImage!
    var currentMood: Int = 0
    var showAdvice: Bool = true


    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func contextForSegueWithIdentifier(segueIdentifier: String) -> AnyObject? {
        
        if segueIdentifier == "RecordMoodSegue" {
            return MoodContextData(moodIndex: currentMood, showAdvice:showAdvice)
        }
        
        return nil;
    }
    
    @IBAction func moodSliderChanged(value: Float) {
        
        currentMood = Int(value)
        println("Current Mood: \(currentMood)")
        updateMoodImage()
        
    }
    
    @IBAction func adviceSwitchChanged(value: Bool) {
        
        showAdvice = value
        println("Current switch value: \(showAdvice)")
        
    }
    
    @IBAction func halpButtonTapped() {
        pushControllerWithName("HelpController", context: MoodContextData(moodIndex: currentMood, showAdvice: showAdvice))
    }
    
    func updateMoodImage(){
        if currentMood < 0 || currentMood > 4 {
            return
        }
        
        moodImage.setImageNamed("rage\(currentMood)")
    }

}
