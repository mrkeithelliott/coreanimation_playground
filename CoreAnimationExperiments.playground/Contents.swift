//: Playground - noun: a place where people can play

import UIKit
import QuartzCore
import XCPlayground


let view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
view.layer.borderColor = UIColor.lightGrayColor().CGColor
view.layer.masksToBounds = true
view.layer.cornerRadius = 6
view.layer.borderWidth = 8


let circle_frame = CGRect(x: view.frame.width/2 - 140, y: view.frame.height/2 - 140, width: 280, height: 280)
var shapeLayer = CAShapeLayer()
shapeLayer.path = UIBezierPath(roundedRect: circle_frame, cornerRadius: circle_frame.height/2).CGPath
shapeLayer.fillColor = UIColor.blueColor().CGColor


let label = UILabel()

label.text = "0"
label.textColor = UIColor.whiteColor()
label.font = UIFont.systemFontOfSize(100)
label.sizeToFit()
label.textAlignment = .Center
label.frame = CGRect(x: view.frame.width/2 - label.frame.width/2, y: view.frame.height/2 - label.frame.height/2, width: label.frame.width, height: label.frame.height)


let inner_ring = UIImage(named: "inner_ring")
let inner_ring_iv = UIImageView(image: inner_ring!)
inner_ring_iv.frame = CGRect(x: view.frame.width/2 - 150, y: view.frame.height/2 - 150, width: 300, height: 300)

let outer_ring = UIImage(named: "outer_ring")
let outer_ring_iv = UIImageView(image: outer_ring!)
outer_ring_iv.frame = CGRect(x: view.frame.width/2 - 170, y: view.frame.height/2 - 170, width: 340, height: 340)

view.layer.addSublayer(shapeLayer)
view.layer.addSublayer(label.layer)
view.layer.addSublayer(inner_ring_iv.layer)
view.layer.addSublayer(outer_ring_iv.layer)
view.backgroundColor = UIColor.whiteColor()

let textFormatter = CountDownFormatter()

var values:[String] = []
for val in 0...100{
    values.append("\(val)")
}

let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
rotationAnim.fromValue = M_PI * 2
rotationAnim.duration = 1.0
rotationAnim.repeatCount = 1
rotationAnim.removedOnCompletion = false
inner_ring_iv.layer.addAnimation(rotationAnim, forKey: nil)

let counterRotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
counterRotationAnim.fromValue = -(M_2_PI * 2)
counterRotationAnim.duration = 1.3
counterRotationAnim.repeatCount = 1
counterRotationAnim.removedOnCompletion = false
outer_ring_iv.layer.addAnimation(counterRotationAnim, forKey: nil)



view

XCPlaygroundPage.currentPage.liveView = view




