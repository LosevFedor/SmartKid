//
//  GameScene.swift
//  SmartKid
//
//  Created by Fedor Losev on 14/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import SpriteKit

private enum bitMask: UInt32 {
    case object1Category = 1
    case object2Category = 2
    case object3Category = 3
    case object4Category = 4
    case object5Category = 5
    
    case borderCategory = 10
}

private enum ufo: String {
    case ufo1 = "ufo1"
    case ufo2 = "ufo2"
    case ufo3 = "ufo3"
    case ufo4 = "ufo4"
    case ufo5 = "ufo5"
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Static property
    static var gameScenePresenter: ReadSyllablesViewPresenterProtocol!
    static var currentReadingSyllableScene = 0
    static var currentSceneGameScene: GameScene!
    
    // MARK: - Private property
    private var arrayObjects = [SKObject?]()
    private var borderBody: SKPhysicsBody!
    private var gameIsOver = false
    private var arrayObjectsTexture = [ufo.ufo1.rawValue, ufo.ufo2.rawValue, ufo.ufo3.rawValue, ufo.ufo4.rawValue, ufo.ufo4.rawValue]
    private var readSyllablesPresenter = gameScenePresenter
    
    // MARK: - Internal property
    internal var currentOneSyllableInButtonOne: String!
    internal var currentTwoSyllableINButtonTwo: String!
    
    internal var isOneSyllableBtnActive: Bool = true
    internal var isTwoSyllableBtnActive: Bool = false
    
    internal var isOneSyllableWasFind: Bool = false
    internal var isTwoSyllableWasFind: Bool = false
    
    // MARK: - Lazy property
    lazy var background: SKSpriteNode = {
        let background = SKSpriteNode(imageNamed: "readSyllableBackground")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = BACKGROUND_ANCHOR_POINT
        background.zPosition = BACKGROUND_Z_POSITION
        return background
    }()
    
    lazy var object1: SKObject = {
        let objectTextureName = arrayObjectsTexture.randomElement()!
        let objectTexture = SKTexture(imageNamed: objectTextureName)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/2, y: size.height - (size.height/3))
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_1_GAME_1_NAME
        object.physicsBody = SKPhysicsBody(circleOfRadius: objectTexture.size().width/2)
        object.physicsBody?.categoryBitMask = bitMask.object1Category.rawValue
        object.physicsBody?.contactTestBitMask = bitMask.object3Category.rawValue | bitMask.object1Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody!.collisionBitMask = bitMask.object3Category.rawValue | bitMask.object1Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.linearDamping = 0.0
        object.physicsBody?.restitution = 0.0
        return object
    }()
    
    lazy var object2: SKObject = {
        let objectTextureName = arrayObjectsTexture.randomElement()!
        let objectTexture = SKTexture(imageNamed: objectTextureName)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/3, y: size.height/2)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_2_GAME_1_NAME
        object.physicsBody = SKPhysicsBody(circleOfRadius: objectTexture.size().width/2)
        object.physicsBody?.categoryBitMask = bitMask.object2Category.rawValue
        object.physicsBody?.contactTestBitMask = bitMask.object1Category.rawValue | bitMask.object3Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody!.collisionBitMask = bitMask.object1Category.rawValue | bitMask.object3Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.linearDamping = 0.0
        object.physicsBody?.restitution = 0.0
        return object
    }()
    
    lazy var object3: SKObject = {
        let objectTextureName = arrayObjectsTexture.randomElement()!
        let objectTexture = SKTexture(imageNamed: objectTextureName)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width - (size.width/3), y: size.height/2)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_3_GAME_1_NAME
        object.physicsBody = SKPhysicsBody(circleOfRadius: objectTexture.size().width/2)
        object.physicsBody?.categoryBitMask = bitMask.object3Category.rawValue
        object.physicsBody?.contactTestBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody!.collisionBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object4Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.linearDamping = 0.0
        object.physicsBody?.restitution = 0.0
        return object
    }()
    
    lazy var object4: SKObject = {
        let objectTextureName = arrayObjectsTexture.randomElement()!
        let objectTexture = SKTexture(imageNamed: objectTextureName)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) - 125, y: size.height/3 - 100)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_4_GAME_1_NAME
        object.physicsBody = SKPhysicsBody(circleOfRadius: objectTexture.size().width/2)
        object.physicsBody?.categoryBitMask = bitMask.object4Category.rawValue
        object.physicsBody?.contactTestBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object3Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody!.collisionBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object3Category.rawValue | bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.linearDamping = 0.0
        object.physicsBody?.restitution = 0.0
        return object
    }()
    
    lazy var object5: SKObject = {
        let objectTextureName = arrayObjectsTexture.randomElement()!
        let objectTexture = SKTexture(imageNamed: objectTextureName)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) , y: size.height/3 )
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_5_GAME_1_NAME
        object.physicsBody = SKPhysicsBody(circleOfRadius: objectTexture.size().width/2)
        object.physicsBody?.categoryBitMask = bitMask.object5Category.rawValue
        object.physicsBody?.contactTestBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object3Category.rawValue | bitMask.object4Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody!.collisionBitMask = bitMask.object1Category.rawValue | bitMask.object2Category.rawValue | bitMask.object3Category.rawValue | bitMask.object4Category.rawValue | bitMask.borderCategory.rawValue
        object.physicsBody?.affectedByGravity = false
        object.physicsBody?.linearDamping = 0.0
        object.physicsBody?.restitution = 0.0
        return object
    }()
    
    // MARK: - Initializer
    override init(size: CGSize) {
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override func
    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        physicsWorld.gravity = CGVector(dx: 0.0, dy: 0.0)
        
        setBorderBody()
        addChilds()
        appendObjectsToArray()
        showApearObjects()
        setFirstObjectsVelosity()
        showObjectsTitle()
    }
    
    // MARK: - Handlers
    @objc func handlerCreateNewScene(){
        if gameIsOver{
            gameIsOver = false
            
            let newScene = GameScene(size: self.size)
            
            GameScene.currentSceneGameScene = newScene
            
            newScene.scaleMode = self.scaleMode
            
            GameScene.currentReadingSyllableScene += 1
            let countArray = getShufledArrayReadingSyllablePlist().count
            
            if GameScene.currentReadingSyllableScene > countArray - 1{
                GameScene.currentReadingSyllableScene = 0
            }
            readSyllablesPresenter!.showSyllableOneBtnTitle(cyrrentCountGame: GameScene.currentReadingSyllableScene)
            readSyllablesPresenter!.showSyllableTwoBtnTitle(cyrrentCountGame: GameScene.currentReadingSyllableScene)
            readSyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene.currentReadingSyllableScene, isHudenImage: true)
            
            readSyllablesPresenter!.showOneButtonImage()
            readSyllablesPresenter!.showTwoButtonImage()
            
            self.view?.presentScene(newScene)
        }
    }
    
    @objc func handlerShowCurrentImage(){
        readSyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene.currentReadingSyllableScene, isHudenImage: false)
        readSyllablesPresenter!.showCurrentImageAnimation()
    }
    
    @objc func handlerOneButtonAction(){
        readSyllablesPresenter!.showOneButtonAction(GameScene.currentReadingSyllableScene)
    }
    
    @objc func handlerTwoButtonAction(){
        readSyllablesPresenter!.showTwoButtonAction(GameScene.currentReadingSyllableScene)
    }
    
    @objc func handlerTogetherButtonAction(){
        readSyllablesPresenter!.showTogetherButtonAction(GameScene.currentReadingSyllableScene)
    }
    
    // MARK: - Internal proprty
    internal func getCurrentScene() -> GameScene{
        guard let currentScene = GameScene.currentSceneGameScene else { return self }
        return currentScene
    }
    
    internal func removeAllPerform(){
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    // MARK: - Private func
    private func showObjectsTitle(){
        readSyllablesPresenter!.showTittle(cyrrentCountGame: GameScene.currentReadingSyllableScene, currentScene: self)
    }
    
    private func setBorderBody(){
        borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        borderBody.categoryBitMask = bitMask.borderCategory.rawValue
        borderBody.friction = 0.0
        self.physicsBody = borderBody
    }
    
    private func setFirstObjectsVelosity(){
        for object in arrayObjects{
            object!.physicsBody?.velocity = calculateRandomObjectVelosity()
        }
    }
    
    private func calculateRandomObjectVelosity() -> CGVector{
        let randomVelosityByX = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_1..<MAX_VELOSITY_OBJECT_GAME_SCENE_1)
        let randomVelosityByY = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_1..<MAX_VELOSITY_OBJECT_GAME_SCENE_1)
        let randomVelosity = CGVector(dx: randomVelosityByX * cos(100.0), dy: randomVelosityByY * sin(100.0))
        return randomVelosity
    }
    
    private func addChilds(){
        addChild(background)
        addChild(object1)
        addChild(object2)
        addChild(object3)
        addChild(object4)
        addChild(object5)
    }
    
    private func removeObjectFromNode(_ touch: UITouch, _ node: SKNode){
        let object = node as! SKObject
        if object.contains(touch.location(in: self)){
            guard let currentObjectIndex = self.arrayObjects.firstIndex(of: object) else{ return }
            if isOneSyllableBtnActive{
                if currentOneSyllableInButtonOne == object.getObjectTitle(){
                    rightChuseObject(currentObjectIndex, object, ONE_BTN_TRAVEL_DIRECTION_DEFAULT)
                    
                    isOneSyllableBtnActive = !isOneSyllableBtnActive
                    isTwoSyllableBtnActive = !isTwoSyllableBtnActive
                    isOneSyllableWasFind = !isOneSyllableWasFind
                    
                    readSyllablesPresenter!.showFinishActiveOneButtonImage()
                    readSyllablesPresenter!.showActiveTwoButtonImage()
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
                        guard let self = self else { return }
                        self.readSyllablesPresenter!.playSoundSyllableOne(cyrrentCountGame: GameScene.currentReadingSyllableScene)
                    }
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }else if isTwoSyllableBtnActive{
                if currentTwoSyllableINButtonTwo == object.getObjectTitle(){                    
                    rightChuseObject(currentObjectIndex, object, TWO_BTN_TRAVEL_DIRECTION_DEFAULT)
                    
                    isTwoSyllableBtnActive = !isTwoSyllableBtnActive
                    isTwoSyllableWasFind = !isTwoSyllableWasFind
                    
                    readSyllablesPresenter!.showFinishActiveTwoButtonImage()
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
                        guard let self = self else { return }
                        self.readSyllablesPresenter!.playSoundSyllableTwo(cyrrentCountGame: GameScene.currentReadingSyllableScene)
                    }
                    
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }
            currentGameIsOver()
        }
    }
    
    private func currentGameIsOver(){
        if isOneSyllableWasFind && isTwoSyllableWasFind{
            
            for object in arrayObjects{
                let apear = SKAction.scale(to: 0, duration: 0.5)
                let actionRemove = SKAction.removeFromParent()
                let wait = SKAction.wait(forDuration: 1.0)
                let actions = [wait,apear,actionRemove]
                object!.run(SKAction.sequence(actions))
            }
            self.arrayObjects.removeAll()
            
            perform(#selector(handlerShowCurrentImage), with: nil, afterDelay: SHOW_CURRENT_IMAGE_TIME_INTERVAL)
            perform(#selector(handlerOneButtonAction), with: nil, afterDelay: SHOW_ONE_BUTTON_ACTION_TIME_INTERVAL)
            perform(#selector(handlerTwoButtonAction), with: nil, afterDelay: SHOW_TWO_BUTTON_ACTION_TIME_INTERVAL)
            perform(#selector(handlerTogetherButtonAction), with: nil, afterDelay: SHOW_TOGETHER_BUTTONS_ACTION_TIME_INTERVAL)
            
            gameIsOver = true
            
            if gameIsOver{
                perform(#selector(handlerCreateNewScene), with: nil, afterDelay: CREATE_NEW_SCENE_TIME_INTERVAL)
            }
            
        }
    }
    
    private func rightChuseObject(_ index: Int, _ object: SKObject, _ travelDirection: CGFloat){
        self.arrayObjects.remove(at: index)
        
        readSyllablesPresenter!.playUfoDeadSound()
        
        let apearTexture = SKAction.scale(to: 0, duration: 0.7)
        let apearActionRemove = SKAction.removeFromParent()
        let apearActions = [apearTexture,apearActionRemove]
        object.run(SKAction.sequence(apearActions))
        object.beginUfoAnimation(folder: FOLDER_EXPLOSION_IMAGE_NAME, texture: BANG_TEXTURE_NAME)
    }
    
    private func failChuseObject(_ index: Int){
        arrayObjects[index]!.physicsBody?.velocity = calculateRandomObjectVelosity()
        wrongAnswerSound()
    }
    
    private func showApearObjects(){
        let apearBubble = SKAction.scale(to: OBJECT_GAME_1_SCALE, duration: OBJECT_GAME_1_DURATION)
        let action = [apearBubble]
        
        object1.run(SKAction.sequence(action))
        object2.run(SKAction.sequence(action))
        object3.run(SKAction.sequence(action))
        object4.run(SKAction.sequence(action))
        object5.run(SKAction.sequence(action))
    }
    
    private func appendObjectsToArray(){
        arrayObjects.append(object1)
        arrayObjects.append(object2)
        arrayObjects.append(object3)
        arrayObjects.append(object4)
        arrayObjects.append(object5)
    }
    
    private func hitObjectVSObjectSound(){
        let sound = SKAction.playSoundFileNamed(SOUND_OBJECT_VS_OBJECT, waitForCompletion: true)
        let actions = [sound]
        run(SKAction.sequence(actions))
    }
    
    private func changeUfoShip(someObject: SKObject){
        guard let randomName = arrayObjectsTexture.randomElement() else { return }
        someObject.texture = SKTexture(imageNamed: randomName)
    }
    
    private func wrongAnswerSound(){
        let sound = SKAction.playSoundFileNamed(SOUND_WRONG_ANSWER, waitForCompletion: true)
        let actions = [sound]
        run(SKAction.sequence(actions))
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let contactMask = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        switch contactMask {
        case bitMask.object1Category.rawValue | bitMask.object2Category.rawValue:
            object1.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object1)
        case bitMask.object1Category.rawValue | bitMask.object3Category.rawValue:
            object1.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object1)
        case bitMask.object1Category.rawValue | bitMask.object4Category.rawValue:
            object1.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object1)
        case bitMask.object1Category.rawValue | bitMask.object5Category.rawValue:
            object1.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object1)
        case bitMask.object1Category.rawValue | bitMask.borderCategory.rawValue:
            object1.physicsBody?.velocity = calculateRandomObjectVelosity()
            changeUfoShip(someObject: object1)
            
        case bitMask.object2Category.rawValue | bitMask.object1Category.rawValue:
            object2.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object2)
        case bitMask.object2Category.rawValue | bitMask.object3Category.rawValue:
            object2.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object2)
        case bitMask.object2Category.rawValue | bitMask.object4Category.rawValue:
            object2.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object2)
        case bitMask.object2Category.rawValue | bitMask.object5Category.rawValue:
            object2.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object2)
        case bitMask.object2Category.rawValue | bitMask.borderCategory.rawValue:
            object2.physicsBody?.velocity = calculateRandomObjectVelosity()
            changeUfoShip(someObject: object2)
            
        case bitMask.object3Category.rawValue | bitMask.object1Category.rawValue:
            object3.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object3)
        case bitMask.object3Category.rawValue | bitMask.object2Category.rawValue:
            object3.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object3)
        case bitMask.object3Category.rawValue | bitMask.object4Category.rawValue:
            object3.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object3)
        case bitMask.object3Category.rawValue | bitMask.object5Category.rawValue:
            object3.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object3)
        case bitMask.object3Category.rawValue | bitMask.borderCategory.rawValue:
            object3.physicsBody?.velocity = calculateRandomObjectVelosity()
            changeUfoShip(someObject: object3)
            
        case bitMask.object4Category.rawValue | bitMask.object1Category.rawValue:
            object4.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object4)
        case bitMask.object4Category.rawValue | bitMask.object2Category.rawValue:
            object4.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object4)
        case bitMask.object4Category.rawValue | bitMask.object3Category.rawValue:
            object4.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object4)
        case bitMask.object4Category.rawValue | bitMask.object5Category.rawValue:
            object4.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object4)
        case bitMask.object4Category.rawValue | bitMask.borderCategory.rawValue:
            object4.physicsBody?.velocity = calculateRandomObjectVelosity()
            changeUfoShip(someObject: object4)
            
        case bitMask.object5Category.rawValue | bitMask.object1Category.rawValue:
            object5.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object5)
        case bitMask.object5Category.rawValue | bitMask.object2Category.rawValue:
            object5.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object5)
        case bitMask.object5Category.rawValue | bitMask.object3Category.rawValue:
            object5.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object5)
        case bitMask.object5Category.rawValue | bitMask.object4Category.rawValue:
            object5.physicsBody?.velocity = calculateRandomObjectVelosity()
            hitObjectVSObjectSound()
            changeUfoShip(someObject: object5)
        case bitMask.object5Category.rawValue | bitMask.borderCategory.rawValue:
            object5.physicsBody?.velocity = calculateRandomObjectVelosity()
            changeUfoShip(someObject: object5)
            
        default: print("Unknown contact detected")
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            enumerateChildNodes(withName: NO_NAME) { [weak self] node, _ in
                guard let self = self else { return }
                
                switch node.name{
                case OBJECT_1_GAME_1_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_2_GAME_1_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_3_GAME_1_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_4_GAME_1_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_5_GAME_1_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                default:
                    return
                }
            }
        }
    }
}
