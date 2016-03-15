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
    
    @IBInspectable public var archColor: UIColor = UIColor.blueColor() {
        didSet {
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var width: CGFloat = 20 {
        didSet {
            if self.isDottedSpacingDefault {
                self.dottedSpacing = self.width * 2
            }
            
            if self.isDashPatternDefault {
                self.dashedLinePattern = [self.width,self.width]
            }
            setNeedsDisplay()
        }
    }
    
    
    //Dash
    @IBInspectable public var isDashedLine: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    public var dashedLinePattern: [CGFloat] = [20,20] {
        didSet {
            self.isDashPatternDefault = false
            setNeedsDisplay()
        }
    }
    private var isDashPatternDefault: Bool = true
    
    //Dotted
    @IBInspectable public var isDottedLine: Bool = false {
        didSet {
            setNeedsDisplay()
        }
    }
    public var dottedSpacing: CGFloat = 40 {
        didSet {
            self.isDottedSpacingDefault = false
            setNeedsDisplay()
        }
    }
    private var isDottedSpacingDefault: Bool = true
    
    
    @IBInspectable public var roundCorners: Bool = false
    
    //Padding
    @IBInspectable public var topPadding: CGFloat = 0.0
    @IBInspectable public var bottomPadding: CGFloat = 0.0
    @IBInspectable public var leftPadding: CGFloat = 0.0
    @IBInspectable public var rightPadding: CGFloat = 0.0
    
    private var shapeLayer: CAShapeLayer?
    private var path: UIBezierPath?
    
    private var isHidden: Bool = false

    
    override public func drawRect(rect: CGRect) {
        
        self.ReloadCounterView()
    }
    
    private func ReloadCounterView(){
        
        let center = CGPoint(x:(bounds.width/2)-self.leftPadding+self.rightPadding, y: (bounds.height/2)+self.topPadding-self.bottomPadding)
        
        let radius: CGFloat = min(bounds.width,  bounds.height)
        
        let arcWidth: CGFloat = self.width
        
        let startAngle: CGFloat = self.startAngle
        let endAngle: CGFloat = self.endAngle
        
        let path = UIBezierPath(arcCenter: center,
            radius: radius/2 - arcWidth/2,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true)
        self.path = path
        
        if self.isAnimatable {
            shapeLayer = CAShapeLayer()
            shapeLayer?.path = path.CGPath
            shapeLayer?.fillColor = nil
            shapeLayer?.strokeColor = self.archColor.CGColor
            shapeLayer?.lineWidth = self.width
            
            if self.isDashedLine {
                shapeLayer?.lineDashPattern = self.dashedLinePattern
            } else if self.isDottedLine {
                
                self.shapeLayer?.lineDashPattern = [0, self.dottedSpacing]
                self.shapeLayer?.lineCap = kCALineCapRound
            }
            
            if self.roundCorners {
                self.shapeLayer?.lineCap = kCALineCapRound
            }
            
            self.layer.addSublayer(self.shapeLayer!)
            
        } else {
            
            path.lineWidth = arcWidth
            archColor.setStroke()
            
            if self.isDashedLine {
                
                path.setLineDash(self.dashedLinePattern, count: self.dashedLinePattern.count, phase: 0.0)
                
            } else if self.isDottedLine {
                path.setLineDash([0, self.dottedSpacing], count: self.dashedLinePattern.count, phase: 0.0)
                path.lineCapStyle = CGLineCap.Round
            }
            
            if self.roundCorners {
                path.lineCapStyle = CGLineCap.Round
            }
            
            path.stroke()
        }
    }
    
    public func animate(timeInterval: NSTimeInterval, reverse: Bool, completion: (()->Void)?) {
        
        self.shapeLayer?.hidden = false
        
        CATransaction.begin()
        CATransaction.setCompletionBlock { () -> Void in
            
            completion?()
        }
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = timeInterval
        
        if reverse {
            animation.fromValue = 1
            animation.toValue = 0
        } else {
            animation.fromValue = 0
            animation.toValue = 1
        }
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        self.shapeLayer?.addAnimation(animation, forKey: "strokeEnd")
        CATransaction.commit()
    }
    
    func rotated() {
        self.ReloadCounterView()
    }
    
    public func rotate() {
        
        let transform: CGAffineTransform = CGAffineTransformMakeRotation(2*π)
        self.path?.applyTransform(transform)
    }
}
