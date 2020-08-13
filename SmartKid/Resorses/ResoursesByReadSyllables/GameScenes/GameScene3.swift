//
//  GameScene3.swift
//  SmartKid
//
//  Created by Fedor Losev on 11/04/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import SpriteKit
enum cloudsTextureName: String {
    case cloud1 = "cloud - 1"
}
class GameScene3: SKScene {
    
    // MARK: - Static property
    static var gameScene3: Read3SyllablesViewPresenterProtocol!
    static var currentGameScene = 0
    static var currentSceneGameScene: GameScene3!
    
    // MARK: - Private property
    private var arrayGameObjects = [SKObject?]()
    private var arrayVelosity = [CGPoint]()
    private var objectMovePointsPerSecX = [CGFloat]()
    private var objectMovePointsPerSecY = [CGFloat]()
    
    // private var velosituByIndex:CGPoint!
    
    private var completeUpdate = false
    private var gameIsOver = false
    
    private var lastUpdateTime: TimeInterval = TIME_INTERVAL_ZERO
    private var dt: TimeInterval = TIME_INTERVAL_ZERO
    
    private let min = NUMBER_ZERO
    private let max = NUMBER_FIVE
        
    private let playableRect: CGRect!
    
    private var read3SyllablesPresenter = gameScene3
    
    // MARK: - Internal property
    internal var currentOneSyllableInButtonOne: String!
    internal var currentTwoSyllableInButtonTwo: String!
    internal var currentThreeSyllableInButtonThree: String!
    
    internal var isOneSyllableBtnActive: Bool = true
    internal var isTwoSyllableBtnActive: Bool = false
    internal var isThreeSyllableBtnActive: Bool = false
    
    internal var isOneSyllableWasFind: Bool = false
    internal var isTwoSyllableWasFind: Bool = false
    internal var isThreeSyllableWasFind: Bool = false
    
    // MARK: - Lazy property
    lazy var background: SKSpriteNode = {
        let back = SKSpriteNode(imageNamed: "readSyllableBackground")
        back.position = CGPoint(x: size.width/2, y: size.height/2)
        back.anchorPoint = BACKGROUND_ANCHOR_POINT
        back.zPosition = BACKGROUND_Z_POSITION
        return back
    }()
    
    lazy var object1: SKObject = {
        let objectTexture = SKTexture(imageNamed: cloudsTextureName.cloud1.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/2, y: size.height - (size.height/3))
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_1_GAME_3_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object2: SKObject = {
        let objectTexture = SKTexture(imageNamed: cloudsTextureName.cloud1.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width/3, y: size.height/2)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_2_GAME_3_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object3: SKObject = {
        let objectTexture = SKTexture(imageNamed: cloudsTextureName.cloud1.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: size.width - (size.width/3), y: size.height/2 + 100)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_3_GAME_3_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object4: SKObject = {
        let objectTexture = SKTexture(imageNamed: cloudsTextureName.cloud1.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) - 150, y: size.height/3 - 200)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_4_GAME_3_NAME
        object.changeObjectTitlePosition(OBJECT_TITLE_BELOW)
        return object
    }()
    
    lazy var object5: SKObject = {
        let objectTexture = SKTexture(imageNamed: cloudsTextureName.cloud1.rawValue)
        var object = SKObject(texture: objectTexture, color: .clear, size: objectTexture.size())
        object.position = CGPoint(x: (size.width - (size.width/3)) , y: size.height/3)
        object.zPosition = OBJECT_Z_POSITION
        object.name = OBJECT_5_GAME_3_NAME
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
        appendObjectVelosityToArray()
        
        showApearObjects()
        
        showTextureTitle()
    }
    
    // MARK: - Handlers
    @objc func handlerOneButtonAction(){
        read3SyllablesPresenter!.showOneButtonAction(GameScene3.currentGameScene)
    }
    
    @objc func handlerTwoButtonAction(){
        read3SyllablesPresenter!.showTwoButtonAction(GameScene3.currentGameScene)
    }
    
    @objc func handlerThreeButtonAction(){
        read3SyllablesPresenter!.showThreeButtonAction(GameScene3.currentGameScene)
    }
    
    @objc func handlerShowCurrentImage(){
        read3SyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene3.currentGameScene, isHudenImage: false)
        read3SyllablesPresenter!.showCurrentImageAnimation()
    }
    
    @objc func handlerTogetherButtonsAction(){
        read3SyllablesPresenter!.showTogetherButtonsAction(GameScene3.currentGameScene)
    }
    
    @objc func handlerCreateNewScene(){
        if gameIsOver{
            gameIsOver = false
            
            let newScene = GameScene3(size: self.size)
            newScene.scaleMode = self.scaleMode
            
            GameScene3.currentSceneGameScene = newScene
            
            GameScene3.currentGameScene += 1
            let countArray = getShufledArrayReading3SyllablePlist().count
            
            if GameScene3.currentGameScene > countArray - 1{
                GameScene3.currentGameScene = 0
            }
            
            read3SyllablesPresenter!.showSyllableOneBtnTitle(GameScene3.currentGameScene)
            read3SyllablesPresenter!.showSyllableTwoBtnTitle(GameScene3.currentGameScene)
            read3SyllablesPresenter!.showSyllableThreeBtnTitle(GameScene3.currentGameScene)
            read3SyllablesPresenter!.showCurrentImage(cyrrentCountGame: GameScene3.currentGameScene, isHudenImage: true)
            
            read3SyllablesPresenter!.showOneButtonImage()
            read3SyllablesPresenter!.showTwoButtonImage()
            read3SyllablesPresenter!.showThreeButtonImage()
            
            self.view?.presentScene(newScene)
        }
    }
    
    // MARK: - Internal proprty
    internal func getCurrentScene() -> GameScene3{
        guard let currentScene = GameScene3.currentSceneGameScene else { return self }
        return currentScene
    }
    
    internal func removeAllPerform(){
        NSObject.cancelPreviousPerformRequests(withTarget: self)
    }
    
    // MARK: - Private func
    private func showTextureTitle(){
        read3SyllablesPresenter!.showTittle(cyrrentCountGame: GameScene3.currentGameScene, currentScene: self)
    }
    
    private func addChilds(){
        addChild(background)
        addChild(object1)
        addChild(object2)
        addChild(object3)
        addChild(object4)
        addChild(object5)
    }
    private func showApearObjects(){
        let apearObject = SKAction.scale(to:OBJECT_GAME_3_SCALE, duration: OBJECT_GAME_3_DURATION)
        let action = [apearObject]
        
        object1.run(SKAction.sequence(action))
        object2.run(SKAction.sequence(action))
        object3.run(SKAction.sequence(action))
        object4.run(SKAction.sequence(action))
        object5.run(SKAction.sequence(action))
    }
    
    private func appendObjectsToArray(){
        arrayGameObjects.append(object1)
        arrayGameObjects.append(object2)
        arrayGameObjects.append(object3)
        arrayGameObjects.append(object4)
        arrayGameObjects.append(object5)
    }
    
    private func appendObjectVelosityToArray(){
        for index in min..<arrayGameObjects.count{
            let velosituByIndex = CGPoint(x: objectMovePointsPerSecX[index], y: objectMovePointsPerSecY[index])
            arrayVelosity.append(velosituByIndex)
        }
    }
    
    private func appendRandomObjectsVelosity(){
        for _ in min..<arrayGameObjects.count{
            let randomVelosityByX = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_3..<MAX_VELOSITY_OBJECT_GAME_SCENE_3)/π
            objectMovePointsPerSecX.append(randomVelosityByX)
            
            let randomVelosityByY = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_3..<MAX_VELOSITY_OBJECT_GAME_SCENE_3)/π
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
            //run(soundTest)
        }
        if sprite.position.x >= topRight.x{
            sprite.position.x = topRight.x
            arrayVelosity[index].x = -arrayVelosity[index].x
            //run(soundTest)
        }
        if sprite.position.y <= bottomLeft.y{
            sprite.position.y = bottomLeft.y
            arrayVelosity[index].y = -arrayVelosity[index].y
            //run(soundTest)
            //sprite.texture = SKTexture(image: #imageLiteral(resourceName: "ghostUp"))
        }
        if sprite.position.y >= topRight.y{
            sprite.position.y = topRight.y
            arrayVelosity[index].y = -arrayVelosity[index].y
            //run(soundTest)
        }
    }
    
    var cloud = SKSpriteNode()
    var cloudFlyingFrames: [SKTexture] = []
    
    private func hitObject(_ index: Int, _ object: SKObject){
        arrayVelosity[index].y = -arrayVelosity[index].y
        arrayVelosity[index].x = -arrayVelosity[index].x
        //run(soundTest)
        object.beginObjectAnimation(folder: "clouds", texture: "cloud")
    }
    
    private func checkObjectIntersection(_ firstObject: SKObject){
        for object in arrayGameObjects {
            if firstObject.name != object!.name{
                if object!.frame.insetBy(dx: 20, dy: 10).intersects(firstObject.frame){
                    guard let indexObject = self.arrayGameObjects.firstIndex(of: object) else { return }
                    self.hitObject(indexObject, firstObject)
                }
            }
        }
    }
    
    private func checkColisions(){
        enumerateChildNodes(withName: "//*") { [weak self] node, _ in
            guard let self = self else { return }
            
            switch node.name{
            case OBJECT_1_GAME_3_NAME:
                self.checkObjectIntersection(self.object1)
                break
            case OBJECT_2_GAME_3_NAME:
                self.checkObjectIntersection(self.object2)
                break
            case OBJECT_3_GAME_3_NAME:
                self.checkObjectIntersection(self.object3)
                break
            case OBJECT_4_GAME_3_NAME:
                self.checkObjectIntersection(self.object4)
                break
            case OBJECT_5_GAME_3_NAME:
                self.checkObjectIntersection(self.object5)
                break
            default:
                return
            }
        }
    }
    
    private func removeObjectFromNode(_ touch: UITouch, _ node: SKNode){
        let object = node as! SKObject
        if object.contains(touch.location(in: self)){
            guard let currentObjectIndex = self.arrayGameObjects.firstIndex(of: object) else{ return }
            if isOneSyllableBtnActive{
                if currentOneSyllableInButtonOne == object.getObjectTitle(){
                    read3SyllablesPresenter!.playSoundSyllableOne(cyrrentCountGame: GameScene3.currentGameScene)
                    rightChuseObject(currentObjectIndex, object, ONE_BTN_TRAVEL_DIRECTION_GAME_3)
                    
                    isOneSyllableBtnActive = !isOneSyllableBtnActive
                    isTwoSyllableBtnActive = !isTwoSyllableBtnActive
                    
                    isOneSyllableWasFind = !isOneSyllableWasFind
                    read3SyllablesPresenter!.showActiveTwoButtonImage()
                    read3SyllablesPresenter!.showFinishActiveOneButtonImage()
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }else if isTwoSyllableBtnActive{
                if currentTwoSyllableInButtonTwo == object.getObjectTitle(){
                    read3SyllablesPresenter!.playSoundSyllableTwo(cyrrentCountGame: GameScene3.currentGameScene)
                    rightChuseObject(currentObjectIndex, object, TWO_BTN_TRAVEL_DIRECTION_GAME_3)
                    
                    isTwoSyllableBtnActive = !isTwoSyllableBtnActive
                    isThreeSyllableBtnActive = !isThreeSyllableBtnActive
                    
                    isTwoSyllableWasFind = !isTwoSyllableWasFind
                    read3SyllablesPresenter!.showActiveThreeButtonImage()
                    read3SyllablesPresenter!.showFinishActiveTwoButtonImage()
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }else if isThreeSyllableBtnActive{
                if currentThreeSyllableInButtonThree == object.getObjectTitle(){
                    read3SyllablesPresenter!.playSoundSyllableThree(cyrrentCountGame: GameScene3.currentGameScene)
                    rightChuseObject(currentObjectIndex, object, THREE_BTN_TRAVEL_DIRECTION_GAME_3)
                    
                    isThreeSyllableBtnActive = !isThreeSyllableBtnActive
                    
                    isThreeSyllableWasFind = !isThreeSyllableWasFind
                    
                    read3SyllablesPresenter!.showFinishActiveThreeButtonImage()
                }else{
                    failChuseObject(currentObjectIndex)
                }
            }
            currentGameIsOver()
        }
    }
    
    private func rightChuseObject(_ index: Int, _ object: SKObject, _ travelDirection: CGFloat){
        self.arrayGameObjects.remove(at: index)
        self.arrayVelosity.remove(at: index)
        
        let apearTexture = SKAction.scale(to: 0, duration: 0.7)
        let apearActionRemove = SKAction.removeFromParent()
        let apearActions = [apearTexture,apearActionRemove]
        object.run(SKAction.sequence(apearActions))
        
        
        let objectClearTexture = SKTexture(image: #imageLiteral(resourceName: "clear_texture"))
        object.texture = objectClearTexture
        
        let moveTexture = SKAction.move(to: CGPoint(x: size.width, y: size.height/2 + travelDirection), duration: 0.7)
        let moveActionRemove = SKAction.removeFromParent()
        let moveActions = [moveTexture,moveActionRemove]
        object.run(SKAction.sequence(moveActions))
    }
    
    private func failChuseObject(_ index: Int){
        let randomX = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_3...MAX_VELOSITY_OBJECT_GAME_SCENE_3)
        let randomY = CGFloat.random(in: MIN_VELOSITY_OBJECT_GAME_SCENE_3...MAX_VELOSITY_OBJECT_GAME_SCENE_3)
        arrayVelosity[index].y = randomY
        arrayVelosity[index].x = randomX
        //run(soundTest2)
    }
    
    private func currentGameIsOver(){
        if isOneSyllableWasFind && isTwoSyllableWasFind && isThreeSyllableWasFind{
            
            for object in arrayGameObjects{
                let apear = SKAction.scale(to: 0, duration: OBJECT_GAME_3_DURATION)
                let actionRemove = SKAction.removeFromParent()
                let wait = SKAction.wait(forDuration: 1.0)
                let actions = [wait,apear,actionRemove]
                object!.run(SKAction.sequence(actions))
            }
            self.arrayGameObjects.removeAll()
            self.arrayVelosity.removeAll()
            
            perform(#selector(handlerOneButtonAction),
                    with: nil,
                    afterDelay: SHOW_ONE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL)
            
            perform(#selector(handlerTwoButtonAction),
                    with: nil,
                    afterDelay: SHOW_TWO_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL
            )
            perform(#selector(handlerThreeButtonAction),
                    with: nil,
                    afterDelay: SHOW_THREE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL)
            
            perform(#selector(handlerShowCurrentImage),
                    with: nil,
                    afterDelay: SHOW_CURRENT_IMAGE_GAME_SCENE_3_TIME_INTERVAL)
    
            perform(#selector(handlerTogetherButtonsAction),
                    with: nil,
                    afterDelay: SHOW_TOGETHER_BUTTONS_ACTION_GAME_SCENE_3_TIME_INTERVAL)
            
            gameIsOver = true
            
            if gameIsOver{
                perform(#selector(handlerCreateNewScene), with: nil, afterDelay: CREATE_NEW_SCENE_GAME_SCENE_3_TIME_INTERVAL)
            }
        }
    }
    
    override func didEvaluateActions() {
        checkColisions()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            enumerateChildNodes(withName: NO_NAME) { [weak self] node, _ in
                guard let self = self else { return }
                
                switch node.name{
                case OBJECT_1_GAME_3_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_2_GAME_3_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_3_GAME_3_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_4_GAME_3_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                case OBJECT_5_GAME_3_NAME:
                    self.removeObjectFromNode(touch, node)
                    break
                default:
                    return
                }
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        completeUpdate = arrayGameObjects.count == NUMBER_ZERO ?true :false
        
        if !completeUpdate{
            if lastUpdateTime > 0{
                dt = currentTime - lastUpdateTime
                
            } else{
                dt = 0
            }
            lastUpdateTime = currentTime
            
            for object in arrayGameObjects{
                if object != nil {
                    guard let index = arrayGameObjects.firstIndex(of: object) else { return }
                    
                    moveSprite(sprite: arrayGameObjects[index]!, velosity: arrayVelosity[index])
                    boundsCheckObjects(sprite: arrayGameObjects[index]!, index: index)
                }
            }
        }
    }
    
}

