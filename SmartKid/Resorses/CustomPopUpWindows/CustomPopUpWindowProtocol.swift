//
//  CustomPopUpWindowProtocol.swift
//  SmartKid
//
//  Created by Fedor Losev on 20/05/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation

protocol CustomPopUpWindowProtocol: class{
    func popUpWindowOn(scaleX: CGFloat, scaleY: CGFloat, duration: TimeInterval, alphaShow: CGFloat, alphaHiden: CGFloat)
    
    func popUpWindowOff(scaleX: CGFloat, scaleY: CGFloat, duration: TimeInterval, alphaHiden: CGFloat)
}

