//
//  MoodDetailsController.swift
//  MoodTracker
//
//  Created by Nathan Cope on 12/23/14.
//  Copyright (c) 2014 PlumChoice Inc. All rights reserved.
//

import Foundation
import WatchKit

class MoodDetailsController: WKInterfaceController{
    
    let moodNames = ["OK","Not Bad","Hmm","Anger","RAWR"]
    var currentMood = 0
    var showAdvice = true

    @IBOutlet weak var moodImage: WKInterfaceImage!
    @IBOutlet weak var moodNameLabel: WKInterfaceLabel!
    @IBOutlet weak var moodDescriptionLabel: WKInterfaceLabel!
    @IBOutlet weak var moodAdviceLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
            showAdvice = moodContextData.showAdvice
        }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        moodImage.setImageNamed("rage\(currentMood)")
        moodNameLabel.setText(moodNames[currentMood])
        moodDescriptionLabel.setText("You are feeling SO \(moodNames[currentMood]), eh?")
        
        if showAdvice {
            moodAdviceLabel.setText("Feeling \(moodNames[currentMood])? Maybe you need some coffee!")
            moodAdviceLabel.setHidden(false)
        } else {
            moodAdviceLabel.setHidden(true)
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
}