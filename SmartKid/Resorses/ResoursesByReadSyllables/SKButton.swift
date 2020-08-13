//
//  SKButton.swift
//  SmartKid
//
//  Created by Fedor Losev on 21/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//
import SpriteKit

class SKObject: SKSpriteNode{
    
    private var objectTexture:SKTexture
    private var objectTitle:SKLabelNode
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        self.objectTexture = texture!
        self.objectTitle = SKLabelNode(fontNamed: "A_Duckymanly.Alen.Rus")
        
        super.init(texture:objectTexture , color: .black, size: objectTexture.size())
        
        self.objectTitle.verticalAlignmentMode = SKLabelVerticalAlignmentMode.center;
        self.objectTitle.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.center;
              
        addChild(self.objectTitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setObjectTitle(title: String) {
        self.objectTitle.text = title
        self.objectTitle.fontSize = 30
        self.objectTitle.fontName = "A_Duckymanly.Alen.Rus"
        self.objectTitle.fontColor = .random()
    }
    
    func getObjectTitle() -> String{
        let objectLabel = self.objectTitle.text!
        return objectLabel
    }
    
    func changeObjectTitlePosition(_ newPosition: CGPoint){
        self.objectTitle.position = newPosition
    }
    
    func beginObjectAnimation(folder: String, texture: String) {
        let textureAtlas = SKTextureAtlas(named: folder)
        let frames = ["\(texture) - 2", "\(texture) - 3", "\(texture) - 4",
                      "\(texture) - 5", "\(texture) - 6", "\(texture) - 7",
                      "\(texture) - 8", "\(texture) - 9", "\(texture) - 1"].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.1)
        self.run(animate)
    }
    
    func beginUfoAnimation(folder: String, texture: String) {
        let textureAtlas = SKTextureAtlas(named: folder)
        let frames = ["\(texture)1", "\(texture)2", "\(texture)3",
                      "\(texture)3", "\(texture)2", "\(texture)1"].map { textureAtlas.textureNamed($0) }
        let animate = SKAction.animate(with: frames, timePerFrame: 0.05)
        self.run(animate)
    }
}
