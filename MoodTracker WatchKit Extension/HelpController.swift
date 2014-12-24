//
//  HelpController.swift
//  MoodTracker
//
//  Created by Nathan Cope on 12/23/14.
//  Copyright (c) 2014 PlumChoice Inc. All rights reserved.
//

import Foundation
import WatchKit

class HelpController: WKInterfaceController{

    @IBOutlet weak var helpText: WKInterfaceLabel!
    var currentMood: Int = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        if let moodContextData = context as? MoodContextData {
            currentMood = moodContextData.moodIndex
        }
        
        if currentMood > 2 {
            helpText.setTextColor(UIColor.redColor())
        }
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