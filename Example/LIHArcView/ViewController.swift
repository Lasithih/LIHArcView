//
//  ViewController.swift
//  LIHArcView
//
//  Created by Lasith Hettiarachchi on 03/14/2016.
//  Copyright (c) 2016 Lasith Hettiarachchi. All rights reserved.
//

import UIKit
import LIHArcView

class ViewController: UIViewController {
    
    let π: CGFloat = CGFloat(M_PI)
    
    @IBOutlet weak var viewOne: LIHArcView!
    @IBOutlet weak var viewTwo: LIHArcView!
    @IBOutlet weak var viewThree: LIHArcView!
    @IBOutlet weak var viewFour: LIHArcView!
//    @IBOutlet weak var viewFive: LIHArcView!
//    @IBOutlet weak var viewSix: LIHArcView!

    var viewTwoTimer: NSTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Animatable Arc
        //NOTE: Progress is not animating
        self.viewOne.isAnimatable = true  //default - false
        
        //Progress Arc
        viewTwo.startAngle = -π / 2
        viewTwo.endAngle = -π / 2
        viewTwo.isAnimatable = false //**** Not animatable ****
        self.viewTwoTimer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "viewTwoTimerTick:", userInfo: nil, repeats: true)
        
        //Dashed Arc 1
        self.viewThree.isDashedLine = true
        
        //Dashed Arc 2
        self.viewFour.isDashedLine = true
        self.viewFour.dashedLinePattern = [10,2] //format - [filled points, not filled points]
    }

    override func viewDidAppear(animated: Bool) {
        
        self.viewOne.animatePosition(1.0)
    }
    
    //MARK: - Timers
    func viewTwoTimerTick(timer: NSTimer) {
        if self.viewTwo.endAngle >= 3 * π / 2 {
            self.viewTwo.endAngle = -π / 2
        } else {
            self.viewTwo.endAngle = self.viewTwo.endAngle + π / 90
        }
    }
    
    //MARK: - Events
    @IBAction func animate(sender: UIButton) {
        
        self.viewOne.animatePosition(1.0)
    }
}

