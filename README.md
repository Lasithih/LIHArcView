# LIHArcView

[![CI Status](http://img.shields.io/travis/Lasith Hettiarachchi/LIHArcView.svg?style=flat)](https://travis-ci.org/Lasith Hettiarachchi/LIHArcView)
[![Version](https://img.shields.io/cocoapods/v/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)
[![License](https://img.shields.io/cocoapods/l/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)
[![Platform](https://img.shields.io/cocoapods/p/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)

## Usage

<img src="https://3.bp.blogspot.com/-59M1olQH3xc/VuuqBJ86CUI/AAAAAAAACvw/iqfV_vlMWOoN-kkkBTGW3A41qo6m7QaBA/s400/LIHArcView1_2.gif">
<img src="https://3.bp.blogspot.com/-I9GIeVsR6Os/VuklifaEzzI/AAAAAAAACvc/Wu3gDj3zRb4hYGvBOKWA0mJ7KuiUSisMQ/s400/LIHArcView2_2.gif">

To run the example project, clone the repo, and run `pod install` from the Example directory first.

###Using Storyboarda
Drag UIView to your view controller and set "LIHArcView" as the class of the UIVIew.
<p><img src="https://1.bp.blogspot.com/-6GOOkL5gih4/Vuj2S5eToYI/AAAAAAAACvE/igdOqyFOiTAxjBWQBt1irRUZwbyUDlE_w/s1600/LIHArcView1.png"></p>

<p><img src="https://4.bp.blogspot.com/-XdFVOFm3y6k/Vuj2S_9p46I/AAAAAAAACvA/E113AEvIIgMyeZ27mBQXa8NxhyXPf7ysg/s1600/LIHArcView2.png"></p>

###Using Code
Import the module using
```Swift
    import LIHArcView
```

```Swift
let arcView = LIHArcView()
arcView.width = 10
arcView.arcColor = UIColor.blueColor
```

See the example project for more customizations.

You can change following properties
```Swift
    public var startAngle:CGFloat //Default is 0
    public var endAngle:CGFloat //Default is 2*π
    public var isAnimatable: Bool //Default is false
    public var arcColor: UIColor //Default is UIColor.blueColor
    
    public var width: CGFloat //Default is 20.0
    
    public var isDashedLine: Bool //Default is false
    public var dashedLinePattern: [CGFloat] //Default is [width,width]
    
    public var isDottedLine: Bool //Default is false
    public var dottedSpacing: CGFloat = 40 //Default is width*2
    public var roundCorners: Bool //Default is false
    
    public var topPadding: CGFloat //Default is 0.0
    public var bottomPadding: CGFloat //Default is 0.0
    public var leftPadding: CGFloat //Default is 0.0
    public var rightPadding: CGFloat //Default is 0.0
```

## Requirements
iOS 7+

## Installation

LIHArcView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LIHArcView"
```

## Author

Lasith Hettiarachchi, lasithih@yahoo.com

## License

LIHArcView is available under the MIT license. See the LICENSE file for more info.
