//
//  SecondViewController.swift
//  LIHArcView
//
//  Created by Lasith Hettiarachchi on 3/15/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import LIHArcView

class SecondViewController: UIViewController {
    
    let π: CGFloat = CGFloat(M_PI)
    
    @IBOutlet weak var viewSeven: LIHArcView!
    @IBOutlet weak var viewEight: LIHArcView!
    @IBOutlet weak var viewNine: LIHArcView!
    @IBOutlet weak var viewTen: LIHArcView!
    @IBOutlet weak var viewEleven: LIHArcView!
    @IBOutlet weak var viewTwelve: LIHArcView!
    
    private var viewElevenTimer: NSTimer!
    private var viewTwelveTimer: NSTimer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Dotted arc 1
        self.viewSeven.isDottedLine = true
        
        //Dotted arc 2
        self.viewEight.isDottedLine = true
        self.viewEight.dottedSpacing = 30
        
        //Round Corners 1
        self.viewNine.endAngle = π
        self.viewNine.roundCorners = true
        self.viewNine.bottomPadding = 20
        
        //Round Corners 2
        self.viewTen.isDashedLine = true
        self.viewTen.dashedLinePattern = [10,18]
        self.viewTen.roundCorners = true
        
        //Loading arc
        self.viewEleven.roundCorners = true
        self.viewEleven.endAngle = π + π / 3
        self.viewEleven.startAngle = π + π / 6
        self.viewElevenTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "viewElevenTimerTick:", userInfo: nil, repeats: true)
        
        
        //Round Corners 2
        self.viewTwelve.isDashedLine = true
        self.viewTwelve.dashedLinePattern = [25,14]
        self.viewTwelve.roundCorners = true
        self.viewTwelveTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "viewTwelveTimerTick:", userInfo: nil, repeats: true)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        self.viewTen.rotate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func viewTwelveTimerTick(timer: NSTimer) {
        
        //self.viewTwelve.endAngle = self.getValidatedAngle(self.viewTwelve.endAngle + π / 48)
        //self.viewTwelve.startAngle = self.getValidatedAngle(self.viewTwelve.startAngle + π / 48)
        
    }
    
    func viewElevenTimerTick(timer: NSTimer) {
        
        self.viewEleven.endAngle = self.getValidatedAngle(self.viewEleven.endAngle + π / 48)
        self.viewEleven.startAngle = self.getValidatedAngle(self.viewEleven.startAngle + π / 48)
        
    }
    
    private func getValidatedAngle(angle: CGFloat)->CGFloat {
        
        if angle > 2*π {
            
            return angle - 2*π
            
        } else {
            return angle
        }
    }
}
