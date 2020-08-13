//
//  CustomTapGestureRecognizeABC.swift
//  SmartKid
//
//  Created by Fedor Losev on 19/05/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

class CustomTapGestureRecognizeABC: UITapGestureRecognizer {
    var pictureName: String!
    var pictureSoundName: String!
    var pictureImageView: UIImageView!
    
    var currentTag: Int!
}
