//
//  ArcView.swift
//  circular button scroller
//
//  Created by Lasith Hettiarachchi on 3/14/16.
//  Copyright © 2016 Lasith Hettiarachchi. All rights reserved.
//

import UIKit

let π: CGFloat = CGFloat(M_PI)

@IBDesignable public class LIHArcView: UIView {

    public var startAngle:CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var endAngle:CGFloat = 2*π {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var isAnimatable: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    
    //Dash
    @IBInspectable public var isDashedLine: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    public var dashedLinePattern: [CGFloat] = [6,6] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private var shapeLayer: CAShapeLayer?
    
    @IBInspectable public var archColor: UIColor = UIColor.blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }

    @IBInspectable public var width: CGFloat = 20 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override public func drawRect(rect: CGRect) {
        
        self.ReloadCounterView()
    }
    
    private func ReloadCounterView(){
        
        let center = CGPoint(x:bounds.width/2, y: bounds.height/2)
        
        let radius: CGFloat = min(bounds.width,  bounds.height)
        
        let arcWidth: CGFloat = self.width
        
        let startAngle: CGFloat = self.startAngle
        let endAngle: CGFloat = self.endAngle
        
        let path = UIBezierPath(arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        
        
        if self.isAnimatable {
            shapeLayer = CAShapeLayer()
            shapeLayer?.path = path.CGPath
            shapeLayer?.fillColor = nil
            shapeLayer?.strokeColor = self.archColor.CGColor
            shapeLayer?.lineWidth = self.width
            
            if self.isDashedLine {
                shapeLayer?.lineDashPattern = [5,5]
            }
            
            self.layer.addSublayer(self.shapeLayer!)
            
        } else {
            
            path.lineWidth = arcWidth
            archColor.setStroke()
            
            if self.isDashedLine {
                var count: Int = 0
                for _ in self.dashedLinePattern {
                    count = count + 1
                }
                
                path.setLineDash(self.dashedLinePattern, count: count, phase: 0.0)
            }
            path.stroke()
        }
        
    }
    
    public func animatePosition(timeInterval: NSTimeInterval) {
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = timeInterval
        
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        self.shapeLayer?.addAnimation(animation, forKey: "strokeEnd")
        
    }
}
