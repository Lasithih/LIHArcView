# LIHArcView

[![CI Status](http://img.shields.io/travis/Lasith Hettiarachchi/LIHArcView.svg?style=flat)](https://travis-ci.org/Lasith Hettiarachchi/LIHArcView)
[![Version](https://img.shields.io/cocoapods/v/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)
[![License](https://img.shields.io/cocoapods/l/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)
[![Platform](https://img.shields.io/cocoapods/p/LIHArcView.svg?style=flat)](http://cocoapods.org/pods/LIHArcView)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

###Using Storyboard
Drag UIView to your view controller and set "LIHArcView" as the class of the UIVIew.
<p><img src="https://1.bp.blogspot.com/-6GOOkL5gih4/Vuj2S5eToYI/AAAAAAAACvE/igdOqyFOiTAxjBWQBt1irRUZwbyUDlE_w/s1600/LIHArcView1.png"></p>

<p><img src="https://4.bp.blogspot.com/-XdFVOFm3y6k/Vuj2S_9p46I/AAAAAAAACvA/E113AEvIIgMyeZ27mBQXa8NxhyXPf7ysg/s1600/LIHArcView2.png"></p>

###Using Code
Import the module using
```Swift
    import LIHAlert
```

```Swift
let arcView = LIHArcView()
arcView.width = 10
arcView.arcColor = UIColor.blueColor
```

See the example project for more customizations.

## Requirements
iOS 7+

## Installation

LIHArcView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LIHArcView"
```

## Author

Lasith Hettiarachchi, lasith.h@fidenz.com

## License

LIHArcView is available under the MIT license. See the LICENSE file for more info.
