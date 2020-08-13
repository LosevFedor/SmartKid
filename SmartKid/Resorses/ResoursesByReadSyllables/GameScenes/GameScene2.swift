//
//  GameSceneTwoSyllables.swift
//  SmartKid
//
//  Created by Fedor Losev on 05/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import SpriteKit

enum spotFly: String {
    case blueSpot = "blueSpot"
    case yellowSpot = "yellowSpot"
    case purpleSpot = "purpleSpot"
    case greenSpot = "greenSpot"
    case redSpot = "redSpot"
    case orangeSpot = "orangeSpot"
}

enum flyWay: String{
    case flyStraight = "flyStraight"
    case flyLeft = "flyLeft"
    case flyRight = "flyRight"
    case flyDown = "flyDown"
    case flyUp = "flyUp"
}

class GameScene2: SKScene {
    
    // MARK: - Static property
    static var gameScene2: Read2SyllablesViewPresenterProtocol!
    static var currentGameScene = 0
    static var currentSceneGameScene: GameScene2!
    
    // MARK: - Private property
    private var arrayObjects = [SKObject?]()
    private var arrayVelosity = [CGPoint]()
    private var objectMovePointsPerSecX = [CGFloat]()
    private var objectMovePointsPerSecY = [CGFloat]()
    private let arraySpotFly = [spotFly.blueSpot.rawValue,
                                spotFly.yellowSpot.rawValue,
                                spotFly.purpleSpot.rawValue,
                                spotFly.greenSpot.rawValue,
                                spotFly.redSpot.rawValue,
                                spotFly.orangeSpot.rawValue]
    private var completeUpdate = false
    private var gameIsOver = false
    
    private var lastUpdateTime: TimeInterval = TIME_INTERVAL_ZERO
    private var dt: TimeInterval = TIME_INTERVAL_ZERO
    
    private let min = NUMBER_ZERO
            
    private let playableRect: CGRect!
    
    private var read2SyllablesPresenter = gameScene2
    
    // MARK: - Internal property
    internal var currentOneSyllableInButtonOne: String!
    internal var currentTwoSyllableInButtonTwo: String!
    
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
        let objectTexture = SKTexture(imageNamed: flyWay.flyStraight.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/2, y: size.height - (size.height/3))
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_1_GAME_2_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object2: SKObject = {
        let objectTexture = SKTexture(imageNamed: flyWay.flyStraight.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/3, y: size.height/2)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_2_GAME_2_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object3: SKObject = {
        let objectTexture = SKTexture(imageNamed: flyWay.flyStraight.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width - (size.width/3), y: size.height/2)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_3_GAME_2_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object4: SKObject = {
        let objectTexture = SKTexture(imageNamed: flyWay.flyStraight.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) - 125, y: size.height/3 - 100)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_4_GAME_2_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object5: SKObject = {
        let objectTexture = SKTexture(imageNamed: flyWay.flyStraight.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) , y: size.height/3 )
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_5_GAME_2_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    // MARK: - Initializer
    override init(size: CGSize) {
        let playableHeight = size.width/(MAX_ASPECT_RATIO)-REDUCE_HEIGHT_SKVIEW_OBJECT_BOARD
        let playableMargin = (size.height - playableHeight)/2
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        super.init(size:size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override func
    override func didMove(to view: SKView) {
        addChilds()
        appendObjectsToArray()
        appendRandomObjectsVelosity()
        appendObjectsVelosityToArray()
        showApearObjects()
        showObjectsTitle()
    }
    
    // MARK: - Handlers
    @objc func handlerShowCurrentImage(){
        read2SyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene2.currentGameScene, isHudenImage: false)
        read2SyllablesPresenter!.showCurrentImageAnimation()
    }
    
    @objc func handlerOneButtonAction(){
        read2SyllablesPresenter!.showOneButtonAction(GameScene2.currentGameScene)
    }
    
    @objc func handlerTwoButtonAction(){
        read2SyllablesPresenter!.showTwoButtonAction(GameScene2.currentGameScene)
    }
    
    @objc func handlerTogetherButtonAction(){
        read2SyllablesPresenter!.showTogetherButtonAction(GameScene2.currentGameScene)
    }
    
    @objc func handlerCreateNewScene(){
        if gameIsOver{
            gameIsOver = false
            
            let newScene = GameScene2(size: self.size)
            newScene.scaleMode = self.scaleMode
            
            GameScene2.currentSceneGameScene = newScene
            
            GameScene2.currentGameScene += 1
            let countArray = getShufledArrayReading2SyllablePlist().count
            
            if GameScene2.currentGameScene > countArray - 1{
                GameScene2.currentGameScene = 0
            }
            
            read2SyllablesPresenter!.showSyllableOneBtnTitle(GameScene2.currentGameScene)
            read2SyllablesPresenter!.showSyllableTwoBtnTitle(GameScene2.currentGameScene)
            read2SyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene2.currentGameScene, isHudenImage: true)
            
            read2SyllablesPresenter!.showOneButtonImage()
            read2SyllablesPresenter!.showTwoButtonImage()
            
            self.view?.presentScene(newScene)
        }
    }
    
    // MARK: - Internal proprty
    internal func getCurrentScene() -> GameScene2{
        guard let currentScene = GameScene2.currentSceneGameScene else { return self }
        return currentScene
    }
    
    internal func removeAllPerform(){
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    // MARK: - Private func
    private func showObjectsTitle(){
        read2SyllablesPresenter!.showTittle(cyrrentCountGame: GameScene2.currentGameScene, currentScene: self)
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
                    
                    read2SyllablesPresenter!.showFinishActiveOneButtonImage()
                    read2SyllablesPresenter!.showActiveTwoButtonImage()
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
                        guard let self = self else { return }
                        self.read2SyllablesPresenter!.playSoundSyllableOne(cyrrentCountGame: GameScene2.currentGameScene)
                    }
                    
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }else if isTwoSyllableBtnActive{
                if currentTwoSyllableInButtonTwo == object.getObjectTitle(){
                    rightChuseObject(currentObjectIndex, object, TWO_BTN_TRAVEL_DIRECTION_DEFAULT)
                    
                    isTwoSyllableBtnActive = !isTwoSyllableBtnActive
                    
                    isTwoSyllableWasFind = !isTwoSyllableWasFind
                    
                    read2SyllablesPresenter!.showFinishActiveTwoButtonImage()
                    
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [weak self] _ in
                        guard let self = self else { return }
                        self.read2SyllablesPresenter!.playSoundSyllableTwo(cyrrentCountGame: GameScene2.currentGameScene)
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
                let apear = SKAction.scale(to: 0, duration: OBJECT_GAME_2_DURATION)
                let actionRemove = SKAction.removeFromParent()
                let wait = SKAction.wait(forDuration: 1.0)
                let actions = [wait,apear,actionRemove]
                object!.run(SKAction.sequence(actions))
            }
            self.arrayObjects.removeAll()
            self.arrayVelosity.removeAll()
            
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
        self.arrayVelosity.remove(at: index)
        
        read2SyllablesPresenter!.playSound(name: DEAD_FLY_SOUND_NAME)
        let waitTexture = SKAction.wait(forDuration: 0.3)
        let apearActionRemove = SKAction.removeFromParent()
        let apearActions = [waitTexture,apearActionRemove]
        object.run(SKAction.sequence(apearActions))
        
        guard let randomSpotName =  arraySpotFly.randomElement() else { return }
        let flyDeadTexture = SKTexture(imageNamed: randomSpotName)
        object.texture = flyDeadTexture
    }
    
    private func failChuseObject(_ index: Int){
        let randomX = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_2...MAX_VELOSITY_OBJECT_GAME_SCENE_2)
        let randomY = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_2...MAX_VELOSITY_OBJECT_GAME_SCENE_2)
        arrayVelosity[index].y = randomY
        arrayVelosity[index].x = randomX
        read2SyllablesPresenter!.playSound(name: WRONG_FLY_SOUND_NAME)
    }
    
    private func showApearObjects(){
        let apearObject = SKAction.scale(to:OBJECT_GAME_2_SCALE, duration: OBJECT_GAME_2_DURATION)
        let action = [apearObject]
        
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
    
    private func appendObjectsVelosityToArray(){
        for index in min..<arrayObjects.count{
            let velosituByIndex = CGPoint(x: objectMovePointsPerSecX[index], y: objectMovePointsPerSecY[index])
            arrayVelosity.append(velosituByIndex)
        }
    }
    
    private func appendRandomObjectsVelosity(){
        for _ in min..<arrayObjects.count{
            let randomVelosityByX = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_2..<MAX_VELOSITY_OBJECT_GAME_SCENE_2)/π
            objectMovePointsPerSecX.append(randomVelosityByX)
            
            let randomVelosityByY = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_2..<MAX_VELOSITY_OBJECT_GAME_SCENE_2)/π
            objectMovePointsPerSecY.append(randomVelosityByY)
        }
    }
    
    private func moveSprite(sprite: SKObject, velosity: CGPoint){
        let amountToMove = CGPoint(x: velosity.x * CGFloat(dt),
                                   y: velosity.y * CGFloat(dt))
        sprite.position = CGPoint(x: sprite.position.x + amountToMove.x,
                                  y: sprite.position.y + amountToMove.y)
        
    }
    
    private func boundsCheckObjects(sprite: SKObject, index: Int){
        let bottomLeft = CGPoint(x:REDUCE_WIDTH_SKVIEW_OBJECT_BOARD, y: playableRect.minY)
        let topRight = CGPoint(x:(size.width-REDUCE_WIDTH_SKVIEW_OBJECT_BOARD), y: playableRect.maxY)
        
        if sprite.position.x <= bottomLeft.x{
            sprite.position.x = bottomLeft.x
            arrayVelosity[index].x = -arrayVelosity[index].x
            sprite.texture = SKTexture(imageNamed: flyWay.flyRight.rawValue)
        }
        if sprite.position.x >= topRight.x{
            sprite.position.x = topRight.x
            arrayVelosity[index].x = -arrayVelosity[index].x
            sprite.texture = SKTexture(imageNamed: flyWay.flyLeft.rawValue)
        }
        if sprite.position.y <= bottomLeft.y{
            sprite.position.y = bottomLeft.y
            arrayVelosity[index].y = -arrayVelosity[index].y
            sprite.texture = SKTexture(imageNamed: flyWay.flyUp.rawValue)
        }
        if sprite.position.y >= topRight.y{
            sprite.position.y = topRight.y
            arrayVelosity[index].y = -arrayVelosity[index].y
            sprite.texture = SKTexture(imageNamed: flyWay.flyDown.rawValue)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            enumerateChildNodes(withName: NO_NAME) { [weak self] node, _ in
                guard let self = self else { return }
                
                switch node.name{
                case OBJECT_1_GAME_2_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_2_GAME_2_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_3_GAME_2_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_4_GAME_2_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_5_GAME_2_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                default:
                    return
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        completeUpdate = arrayObjects.count == NUMBER_ZERO ?true :false
        
        if !completeUpdate{
            if lastUpdateTime > 0{
                dt = currentTime - lastUpdateTime
                
            } else{
                dt = 0
            }
            lastUpdateTime = currentTime
            
            for ghost in arrayObjects{
                if ghost != nil {
                    guard let index = arrayObjects.firstIndex(of: ghost) else { return }
                    
                    moveSprite(sprite: arrayObjects[index]!, velosity: arrayVelosity[index])
                    boundsCheckObjects(sprite: arrayObjects[index]!, index: index)
                }
            }
        }
    }
}
