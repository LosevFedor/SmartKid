//
//  Resorses.swift
//  SmartKid
//
//  Created by Fedor Losev on 28/02/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation
import UIKit


public func setTransitionStyle(transitionSide: CATransitionSubtype, view: UIView){
    let transition = CATransition()
    transition.duration = 0.5
    transition.type = CATransitionType.push
    transition.subtype = transitionSide
    transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
    view.window!.layer.add(transition, forKey: kCATransition)
}

public func runSpinAnimationObject (_ viewObject:UIView, _ duration: CGFloat, _ rotations: CGFloat) {
    let rotationAnimation: CABasicAnimation
    rotationAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
    rotationAnimation.toValue = CGFloat(.pi * 2.0) * rotations * duration
    rotationAnimation.duration = CFTimeInterval(duration);
    rotationAnimation.isCumulative = true;
    rotationAnimation.repeatCount = .infinity
    viewObject.layer.add(rotationAnimation, forKey: "rotationAnimation")
}

public func addPulsate(_ viewObject: UIView) {
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 5
    pulse.fromValue = 0.9
    pulse.toValue = 1.0
    pulse.autoreverses = true
    pulse.repeatCount = .infinity
    pulse.initialVelocity = 0.0
    pulse.damping = 0.0
    viewObject.layer.add(pulse, forKey: nil)
}

public func pulsateView(_ view: UIView){
    let pulse = CASpringAnimation(keyPath: "transform.scale")
    pulse.duration = 0.2
    pulse.fromValue = 1.0
    pulse.toValue = 0.8
    pulse.autoreverses = true
    pulse.repeatCount = 2
    pulse.initialVelocity = 0.0
    pulse.damping = 0.2
    view.layer.add(pulse, forKey: nil)
}

public func turnLefrAndRightAnimation(view: UIImageView, rotateFrom: NSNumber, rotateTo: NSNumber){
    let rotation : CABasicAnimation = CABasicAnimation(keyPath:"transform.rotation.z")
    rotation.duration = 0.1
    rotation.isRemovedOnCompletion = true
    rotation.fromValue = rotateFrom
    rotation.toValue = rotateTo
    rotation.autoreverses = true
    view.layer.add(rotation, forKey: "rotate")
}
