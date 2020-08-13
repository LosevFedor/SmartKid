//
//  ConstantTest.swift
//  SmartKidTests
//
//  Created by Fedor Losev on 12/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import XCTest
@testable import SmartKid

class ConstantTest: XCTestCase {
    
    // MARK: - Test Line width size
    func testTwentyPx(){
        let currentNumber:Float = 20
        let constantNumber:Float = TWENTY_PX
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testTwentyFivePx(){
        let currentNumber:Float = 25
        let constantNumber:Float = TWENTY_FIVE_PX
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testThirtyPx(){
        let currentNumber:Float = 30
        let constantNumber:Float = THIRTY_PX
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    // MARK: - Test Time
    func testDurationTime(){
        let currentDurationTime: TimeInterval = 0.6
        let constantDurationTime = DURATION_TIME
        
        XCTAssertEqual(currentDurationTime, constantDurationTime)
    }
    
    func testShowCurrentImageTimeInterval(){
        let currentTimeInterval: TimeInterval = 1.5
        let constantTimeInterval = SHOW_CURRENT_IMAGE_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowOneButtanActionTimeInterval(){
        let currentTimeInterval: TimeInterval = 2.0
        let constantTimeInterval = SHOW_ONE_BUTTON_ACTION_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowTwoButtanActionTimeInterval(){
        let currentTimeInterval: TimeInterval = 3.5
        let constantTimeInterval = SHOW_TWO_BUTTON_ACTION_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowTogetherButtansActionTimeInterval(){
        let currentTimeInterval: TimeInterval = 5.5
        let constantTimeInterval = SHOW_TOGETHER_BUTTONS_ACTION_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testCreateNewSceneTimeInterval(){
        let currentTimeInterval: TimeInterval = 8.0
        let constantTimeInterval = CREATE_NEW_SCENE_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testTimeIntervalZero(){
        let currentTimeInterval: TimeInterval = 0.0
        let constantTimeInterval = TIME_INTERVAL_ZERO
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowCurrentImageeGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 1.5
        let constantTimeInterval = SHOW_CURRENT_IMAGE_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowOneButtonActionGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 2.0
        let constantTimeInterval = SHOW_ONE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowTwoButtonActionGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 3.5
        let constantTimeInterval = SHOW_TWO_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowThreeButtonActionGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 5.0
        let constantTimeInterval = SHOW_THREE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testShowTogetherButtonsActionGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 6.5
        let constantTimeInterval = SHOW_TOGETHER_BUTTONS_ACTION_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testCreateNewSceneGameScene3TimeInterval(){
        let currentTimeInterval: TimeInterval = 8.5
        let constantTimeInterval = CREATE_NEW_SCENE_GAME_SCENE_3_TIME_INTERVAL
        XCTAssertEqual(currentTimeInterval, constantTimeInterval)
    }
    
    func testBubbleActionWithDuration(){
        let currentBubbleActionWithDuration: TimeInterval = 0.5
        let constantBubbleActionWithDuration = BUTTON_ACTION_WITH_DURATION
        
        XCTAssertEqual(currentBubbleActionWithDuration, constantBubbleActionWithDuration)
    }
    
    func testBubbleActionMinDelay(){
        let currentBubbleActionWithDuration: TimeInterval = 0.5
        let constantBubbleActionWithDuration = BUTTON_ACTION_MIN_DELAY
        
        XCTAssertEqual(currentBubbleActionWithDuration, constantBubbleActionWithDuration)
    }
    
    func testBubbleActionMaxDelay(){
        let currentBubbleActionWithDuration: TimeInterval = 1.5
        let constantBubbleActionWithDuration = BUTTON_ACTION_MAX_DELAY
        
        XCTAssertEqual(currentBubbleActionWithDuration, constantBubbleActionWithDuration)
    }
    
    // MARK: - Alpha channel    
    func testAlphaChanel(){
        let currentAlpha: CGFloat = 0.8
        let constantAlpha = ALPHA_CHANNEL
        
        XCTAssertEqual(currentAlpha, constantAlpha)
    }
    
    // MARK: - Plists names
    func testReadSyllablePlistName(){
        let currentName: String = "ReadingSyllables"
        let constantName = RS_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testRead2SyllablePlistName(){
        let currentName: String = "Reading2Syllables"
        let constantName = R2S_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testRead3SyllablePlistName(){
        let currentName: String = "Reading3Syllables"
        let constantName = R3S_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testAdditionAndSubtractionPlistName(){
        let currentName: String = "AdditionAndSubtraction"
        let constantName = AS_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testArithmeticCharactersPlistName(){
        let currentName: String = "ArithmeticCharacters"
        let constantName = ARITHMETIC_CHARACTERS
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testNumbersPlistName(){
        let currentName: String = "Numbers"
        let constantName = AS_NUMBERS_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testPlistName(){
        let currentName: String = "plist"
        let constantName = PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    // MARK: - Sounds name
    func testAppBackgroundSoundName(){
        let currentName: String = "appBackgroundMusic"
        let constantName = APP_BACKGROUND_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }

    func testContentLockSoundName(){
        let currentName: String = "оформи_подписку"
        let constantName = CONTENT_LOCK_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }

    func testSoundNameObjectVSObject(){
        let currentName: String = "ufoCrashToUfo"
        let constantName = SOUND_OBJECT_VS_OBJECT
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundNameWrongAnswer(){
        let currentName: String = "wrongAnswer.wav"
        let constantName = SOUND_WRONG_ANSWER
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundNameSettingsAdult(){
        let currentName: String = "настройки_только_для_взрослых"
        let constantName = SETTINGS_JUST_ADULT
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundStartGame(){
        let currentName: String = "startGame"
        let constantName = START_GAME_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    // MARK: - Subscription image
    func testSoundStartGame(){
        let currentName: String = "noSubscription"
        let constantName = NO_SUBSCRIPTION_IMAGE_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    // MARK: - Read syllables
    func testDeadFlySoundName(){
        let currentName: String = "deadFly"
        let constantName = DEAD_FLY_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testWrongFlySoundName(){
        let currentName: String = "wrongFly"
        let constantName = WRONG_FLY_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBackFingetImageName(){
        let currentName: String = "backFinger"
        let constantName = BACK_FINGET_IMAGE_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBackToMenuImageName(){
        let currentName: String = "backToMenu"
        let constantName = BACK_TOMENU_IMAGE_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testChooseDifficultySoundName(){
        let currentName: String = "chooseDifficulty"
        let constantName = CHOOSE_DIFFICULTY_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testUFODeadSoundName(){
        let currentName: String = "ufoDead"
        let constantName = UFO_DEAD_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testFolderExplosionImageName(){
        let currentName: String = "explosionImage"
        let constantName = FOLDER_EXPLOSION_IMAGE_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBangTextureName(){
        let currentName: String = "взрыв"
        let constantName = BANG_TEXTURE_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelOneSoundName(){
        let currentName: String = "syllableLevelOne"
        let constantName = SYLLABLE_LEVEL_ONE_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelTwoSoundName(){
        let currentName: String = "syllableLevelTwo"
        let constantName = SYLLABLE_LEVEL_ONE_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelThreeSoundName(){
        let currentName: String = "syllableLevelThree"
        let constantName = SYLLABLE_LEVEL_THREE_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testChooseDifficultyTimeInterval(){
        let currentTimeinterval: TimeInterval = 0.4
        let constantTimeinterval = CHOOSE_DIFFICULTY_TIME_INTERVAL
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelOneTimeInterval(){
        let currentTimeinterval: TimeInterval = 2
        let constantTimeinterval = SYLLABLE_LEVEL_ONE_TIME_INTERVAL
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelTwoTimeInterval(){
        let currentTimeinterval: TimeInterval = 2
        let constantTimeinterval = SYLLABLE_LEVEL_TWO_TIME_INTERVAL
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSyllableLevelThreeTimeInterval(){
        let currentTimeinterval: TimeInterval = 2
        let constantTimeinterval = SYLLABLE_LEVEL_THREE_TIME_INTERVAL
        
        XCTAssertEqual(currentName, constantName)
    }

    // MARK: - Numbers
    func testNumberZero(){
        let currentNumber = 0
        let constantNumber = NUMBER_ZERO
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testNumberOne(){
        let currentNumber = 1
        let constantNumber = NUMBER_ONE
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testNumberFive(){
        let currentNumber = 5
        let constantNumber = NUMBER_FIVE
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testNumberNine(){
        let currentNumber = 9
        let constantNumber = NUMBER_NINE
        
        XCTAssertEqual(currentNumber, constantNumber)
    }
    
    func testReduceWidthSKViewObjectBoard(){
        let currentWidth: CGFloat = 80
        let constantWidth = REDUCE_WIDTH_SKVIEW_OBJECT_BOARD
        
        XCTAssertEqual(currentWidth, constantWidth)
    }
    
    func testReduceHeightSKViewObjectBoard(){
        let currentHeight: CGFloat = 170
        let constantHeight = REDUCE_HEIGHT_SKVIEW_OBJECT_BOARD
        
        XCTAssertEqual(currentHeight, constantHeight)
    }
    
    func testObjectGame1Duration(){
        let currentDuration: TimeInterval = 0.5
        let constantDuration = OBJECT_GAME_1_DURATION
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testObjectGame2Duration(){
        let currentDuration: TimeInterval = 0.5
        let constantDuration = OBJECT_GAME_2_DURATION
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testObjectGame3Duration(){
        let currentDuration: TimeInterval = 0.5
        let constantDuration = OBJECT_GAME_3_DURATION
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testObjectTitleBelowPoint(){
        let currentPoint: CGPoint = CGPoint(x: 0, y: -30)
        let constantPoint = OBJECT_TITLE_BELOW
        
        XCTAssertEqual(currentPoint, constantPoint)
    }
    
    // MARK: - Velosity
    func testMaxVelosityGameScene(){
        let currentMaxSpeed: CGFloat = 100
        let constantMaxSpeed = MAX_VELOSITY_OBJECT_GAME_SCENE_1
        
        XCTAssertEqual(currentMaxSpeed, constantMaxSpeed)
    }
    
    func testMinVelosityGameScene(){
        let currentMinSpeed: CGFloat = -100
        let constantMinSpeed = MIN_VELOSITY_OBJECT_GAME_SCENE_1
        
        XCTAssertEqual(currentMinSpeed, constantMinSpeed)
    }
    
    
    func testMaxVelosityGameScene2(){
        let currentMinSpeed: CGFloat = 200
        let constantMinSpeed = MAX_VELOSITY_OBJECT_GAME_SCENE_2
        
        XCTAssertEqual(currentMinSpeed, constantMinSpeed)
    }
    
    func testMinVelosityGameScene2(){
        let currentMinSpeed: CGFloat = -200
        let constantMinSpeed = MIN_VELOSITY_OBJECT_GAME_SCENE_2
        
        XCTAssertEqual(currentMinSpeed, constantMinSpeed)
    }
    
    func testMaxVelosityGameScene3(){
        let currentMinSpeed: CGFloat = 120
        let constantMinSpeed = MAX_VELOSITY_OBJECT_GAME_SCENE_3
        
        XCTAssertEqual(currentMinSpeed, constantMinSpeed)
    }
    
    func testMinVelosityGameScene3(){
        let currentMinSpeed: CGFloat = -120
        let constantMinSpeed = MIN_VELOSITY_OBJECT_GAME_SCENE_3
        
        XCTAssertEqual(currentMinSpeed, constantMinSpeed)
    }
    
    
    // MARK: - Travel Direction
    func testOneBtnTravelDirection(){
        let currentTravelDorection: CGFloat = -200
        let constantTravelDorection = ONE_BTN_TRAVEL_DIRECTION_DEFAULT
        
        XCTAssertEqual(currentTravelDorection, constantTravelDorection)
    }
    
    func testTwoBtnTravelDirection(){
        let currentTravelDorection: CGFloat = 200
        let constantTravelDorection = TWO_BTN_TRAVEL_DIRECTION_DEFAULT
        
        XCTAssertEqual(currentTravelDorection, constantTravelDorection)
    }
    
    func testOneBtnTravelDirectionGame3(){
        let currentTravelDorection: CGFloat = -400
        let constantTravelDorection = ONE_BTN_TRAVEL_DIRECTION_GAME_3
        
        XCTAssertEqual(currentTravelDorection, constantTravelDorection)
    }
    
    func testTwoBtnTravelDirectionGame3(){
        let currentTravelDorection: CGFloat = 0
        let constantTravelDorection = TWO_BTN_TRAVEL_DIRECTION_GAME_3
        
        XCTAssertEqual(currentTravelDorection, constantTravelDorection)
    }
    
    func testThreeBtnTravelDirectionGame3(){
        let currentTravelDorection: CGFloat = 400
        let constantTravelDorection = THREE_BTN_TRAVEL_DIRECTION_GAME_3
        
        XCTAssertEqual(currentTravelDorection, constantTravelDorection)
    }
    
    
    // MARK: - Size Square
    func testSizeOfSquare(){
        let currentSize: CGFloat = 100
        let constantSize = SIZE_OF_SQUARE
        
        XCTAssertEqual(currentSize, constantSize)
    }
    
    // MARK: - Increase and Decreas Button
    func testIncreaseButton(){
        let currentSize: CGFloat = 1.07
        let constantSize = INCREASE_BUTTON
        
        XCTAssertEqual(currentSize, constantSize)
    }
    
    func testDecreaseButton(){
        let currentSize: CGFloat = 1.0
        let constantSize = DECREASE_BUTTON
        
        XCTAssertEqual(currentSize, constantSize)
    }
    
    // MARK: - HomeModule
    func testNameDefaultFieldForNumber(){
        let currentName: String = "fieldForNumbers"
        let constantName = DEFAULD_FIELD_FOR_NUMBER
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testImageNumbersNumbersNamePlist(){
        let currentName: String = "NameImageNumbers"
        let constantName = NAME_IMAGE_NUMBERS_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testFieldWithNumbersNamePlist(){
        let currentName: String = "FieldWithNumbers"
        let constantName = FIELD_WITH_NUMBERS_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    // MARK: - ABCModule
    func testDurationPlaySound(){
        let currentDuration: TimeInterval = 0.3
        let constantDuration = DURATION_PLAY_SOUND
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testZeroRotate(){
        let currentRotate = NSNumber(value:0.0)
        let constantRotate = ROTATE_ZERO
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
    
    func testTenRotate(){
        let currentRotate = NSNumber(value: 10 * 0.0174533)
        let constantRotate = ROTATE_TEN
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
    
    func testMinusTenRotate(){
        let currentRotate = NSNumber(value: -10 * 0.0174533)
        let constantRotate = ROTATE_MINUS_TEN
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
        
    
    // MARK: - NumbersModel and SomeNumbersModel
    
    func testDurationTimeByPlaySound(){
        let currentDuration: TimeInterval = 0.1
        let constantDuration = DURATION_PLAY_SOUND_BY_NUMBERS_MODULE
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
       
    func testChooseNumerTimeInterval(){
        let currentDuration: TimeInterval = 0.4
        let constantDuration = CHOSE_NUMBER_TIME_INTERVAL
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testDurationBeforeAnimateButton(){
        let currentDuration: TimeInterval = 0.4
        let constantDuration = DURATION_BEFORE_ANIMATE_BUTON
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testDurationBeforeShowSomeNumber(){
        let currentDuration: TimeInterval = 1.7
        let constantDuration = DURATION_BEFORE_SHOW_SOME_NUMBER
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testDurationWigleAnimationByDrawingboard(){
        let currentDuration: TimeInterval = 3.5
        let constantDuration = DURATION_WIGLE_ANIMATION_BY_DRAWINGBOARD
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testNumberLongNamePlist(){
        let currentName: String = "NumbersLongNames"
        let constantName = NUMBER_LONG_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testNumberImagesNamePlist(){
        let currentName: String = "NumberImages"
        let constantName = NUMBER_IMAGES_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSketchNumberNamePlist(){
        let currentName: String = "SketchNumbers"
        let constantName = SKETCH_NUMBER_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testPictureFingersNamePlist(){
        let currentName: String = "PictureFingers"
        let constantName = PICTURE_FINGERS_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBackBtnNamePlist(){
        let currentName: String = "BackBtn"
        let constantName = BACK_BTN_NAME_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testForwardBtnNamePlist(){
        let currentName: String = "ForwardBtn"
        let constantName = FORWARD_BTN_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundDrawNumberPlist(){
        let currentName: String = "SoundDrawNumber"
        let constantName = SOUND_DRAW_NUMBER_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundFingerNamePlist(){
        let currentName: String = "SoundFingers"
        let constantName = SOUND_FINGER_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSoundNumberNamePlist(){
        let currentName: String = "SoundNumbers"
        let constantName = SOUND_NUMBER_PLIST
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testChooseNumerSoundName(){
        let currentName: String = "chooseNumber"
        let constantName = CHOOSE_NUMBER_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSomeNumberRotateZero(){
        let currentRotate = NSNumber(value: 0.0)
        let constantRotate = SOME_NUMBER_ROTATE_ZERO
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
    
    func testSomeNumberRotateFive(){
        let currentRotate = NSNumber(value: 5 * 0.0174533)
        let constantRotate = SOME_NUMBER_ROTATE_FIVE
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
    
    func testSomeNumberRotateMinusFive(){
        let currentRotate = NSNumber(value: -5 * 0.0174533)
        let constantRotate = SOME_NUMBER_ROTATE_MINUS_FIVE
        
        XCTAssertEqual(currentRotate, constantRotate)
    }
    
    // MARK: - Settings module
    func testBackgroundMusicOffName(){
        let currentString: String = "фоновая_мелодия_отключена"
        let constantString = BACKGROUND_MUSIC_OFF_NAME
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testBackgroundMusicOnName(){
        let currentString: String = "фоновая_мелодия_включена"
        let constantString = BACKGROUND_MUSIC_ON_NAME
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testMailAddres(){
        let currentString: String = "developer.smartkid@gmail.com"
        let constantString = MAIL_ADDRESS
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testErrorMailAddres(){
        let currentString: String = "Упс! Почта не настроена"
        let constantString = ERROR_MAIL_TITLE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testErrorMailText(){
        let currentString: String = "Настройте устройство для отправки электронной почты"
        let constantString = ERROR_MAIL_TEXT
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testOkBtn(){
        let currentString: String = "Ok"
        let constantString = OK_BTN
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testSubscriptionUsernameText(){
        let currentString: String = "Оформите подписку \"УчисьИграй\" на 1 месяц"
        let constantString = SUBSCRIBE_USERNAME_TEXT
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testCostDescriptionText(){
        let currentString: String = "Стоимость подписки"
        let constantString = COST_DESCRIPTION_TEXT
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testWhatUserGetWhenSubscriptionText(){
        let currentString: String = "Оформив подписку вы получите полный доступ к играм: Алфавит, Слоги, Сложение и вычитание, Цифры"
        let constantString = WHAT_USER_GET_WHEN_SUBSCRIBE_TEXT
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testSubscriptionDescriptionText(){
        let currentString: String = "Оплата будет снята с учетной записи iTunes при подтверждении покупки.Подписка автоматически продлевается, если автоматическое продление не будет отключено по крайней мере за 24 часа до окончания текущего периода. С аккаунта будет взиматься плата за продление в течение 24 часов до окончания текущего периода.Подписки могут управляться пользователем, а автоматическое продление может быть отключено путем перехода к настройкам учетной записи пользователя после покупки."
        let constantString = SUDSCIBE_DESCRIPTION_TEXT
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testTermsOfUse(){
        let currentString: String = "Условия использования подписки по аресу https://supportwebpage.wordpress.com/smartkid-terms-of-use/"
        let constantString = DESCRIPTION_LINK_TERM_OF_USE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testPrivacyPolicy(){
        let currentString: String = "Узнать о политике конфиденциальности вы можете по адресу https://supportwebpage.wordpress.com/smartkid-privacy-policy/"
        let constantString = DESCRIPTION_LINK_PRIVACY_POLICY
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testLinkTermsOfUse(){
        let currentString: String = "https://supportwebpage.wordpress.com/smartkid-terms-of-use/"
        let constantString = LINK_TERM_OF_USE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testLinkPrivacyPolicy(){
        let currentString: String = "https://supportwebpage.wordpress.com/smartkid-terms-of-use/"
        let constantString = LINK_PRIVACY_POLICY
        
        XCTAssertEqual(currentString, constantString)
    }
    
    // MARK: - All categories
    func testChooseGameTimeInterval(){
        let currentDuration: TimeInterval = 0.4
        let constantDuration = CHOOSE_GAME_TIME_INTERVAL
        
        XCTAssertEqual(currentDuration, constantDuration)
    }
    
    func testChooseGameSoundName(){
        let currentString: String = "chooseGame"
        let constantString = CHOOSE_GAME_SOUND_NAME
        
        XCTAssertEqual(currentString, constantString)
    }
        
    // MARK: - AdditionAndSubtractionModule
    func testIntersectionAreaByX(){
        let currentX: CGFloat = -10
        let constantX = INTERSECTION_AREA_BY_X
        
        XCTAssertEqual(currentX, constantX)
    }
    
    func testIntersectionAreaByY(){
        let currentY: CGFloat = -10
        let constantY = INTERSECTION_AREA_BY_Y
        
        XCTAssertEqual(currentY, constantY)
    }
    
    func testDeinitAdditionAndSubtractionModule(){
        let currentString: String = "deinit AdditionAndSubtractionModule"
        let constantString = DEINIT_ADDITION_AND_SUBTRACTION_MODULE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testDefaultViewNumber(){
        let currentString: String = "default viewNumber"
        let constantString = DEFAULD_VIEW_NUMBER
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testDefaultViewPicture(){
        let currentString: String = "default viewPicture"
        let constantString = DEFAULD_VIEW_PICTURE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testNilCharacter(){
        let currentString: String = "nil character"
        let constantString = NIL_CHARACTER
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testNotFindArithmeticCharactersPlist(){
        let currentString: String = "Cannot find path to ArithmeticCharacters.plist"
        let constantString = NOT_FIND_ARITHMETIC_CHARACTERS_PLIST
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testNoCharacters(){
        let currentString: String = "No character"
        let constantString = NO_CHARACTERS
        
        XCTAssertEqual(currentString, constantString)
    }
    
    
    func testYellowPencilSoundName(){
        let currentName: String = "yellowPencil"
        let constantName = YELLOW_PENCIL_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testRedPencilSoundName(){
        let currentName: String = "redPencil"
        let constantName = RED_PENCIL_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBluePencilSoundName(){
        let currentName: String = "bluePencil"
        let constantName = BLUE_PENCIL_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testGreenPencilSoundName(){
        let currentName: String = "greenPencil"
        let constantName = GREEN_PENCIL_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testMiddlePointSoundName(){
        let currentName: String = "middlePoint"
        let constantName = MIDDLE_POINT_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testSmallePointSoundName(){
        let currentName: String = "smallPoint"
        let constantName = SMALL_POINT_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testBigPointSoundName(){
        let currentName: String = "bigPoint"
        let constantName = BIG_POINT_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testClearLineSoundName(){
        let currentName: String = "claerLine"
        let constantName = CLEAR_LINE_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testClearBoardSoundName(){
        let currentName: String = "clearBoard"
        let constantName = CLEAR_BOARD_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testEraserBoardSoundName(){
        let currentName: String = "eraser"
        let constantName = ERASER_SOUND_NAME
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testEqualSound(){
        let currentString: String = "равно"
        let constantString = EQUAL_SOUND
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testSoundType(){
        let currentString: String = "wav"
        let constantString = SOUND_TYPE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testWinnerSoundNamePlist(){
        let currentString: String = "WinnerSounds"
        let constantString = WINNER_SOUND_PLIST
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testLoseSoundNamePlist(){
        let currentString: String = "LoseSounds"
        let constantString = LOSE_SOUND_PLIST
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testNewConcatinateSoundFileName(){
        let currentString: String = "currentSavedArithmeticResultSound.wav"
        let constantString = NEW_CONCATINATE_SOUND_FILE_NAME
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testHowMuchWillSoundImage(){
        let currentString: String = "howMuchWill"
        let constantString = HOW_MUCH_WILL_SOUND_IMAGE
        
        XCTAssertEqual(currentString, constantString)
    }
    
    func testQuestionSoundImage(){
        let currentString: String = "вопрос"
        let constantString = QUESTION_SOUND_IMAGE
        
        XCTAssertEqual(currentString, constantString)
    }

    func testπ(){
        let currentπ = CGFloat(Double.pi)
        let constantπ = π
        
        XCTAssertEqual(currentπ, constantπ)
    }
    
    // MARK: - Posituins
    func testBackgroundZPosition(){
        let currentZPosition: CGFloat = -1
        let constantZPosition = BACKGROUND_Z_POSITION
        
        XCTAssertEqual(currentZPosition, constantZPosition)
    }
    
    func testObjectZPosition(){
        let currentZPosition: CGFloat = 1
        let constantZPosition = OBJECT_Z_POSITION
        
        XCTAssertEqual(currentZPosition, constantZPosition)
    }
    
    // MARK: - Aspect Ratio
    func testMaxAspectRatio(){
        let currentAspectRatio: CGFloat = 16.0/9.0
        let constantAspectRatio = MAX_ASPECT_RATIO
        
        XCTAssertEqual(currentAspectRatio, constantAspectRatio)
    }
    
    
    // MARK: - Anchor Point
    func testBackgroundAnchorPoint(){
        let currentAnchorPoint = CGPoint(x: 0.5, y: 0.5)
        let constantAnchorPoint = BACKGROUND_ANCHOR_POINT
        
        XCTAssertEqual(currentAnchorPoint, constantAnchorPoint)
    }
    
    // MARK: - Scale
    func testObjectGame1Scale(){
        let currentScale: CGFloat = 3.0
        let constantScale = OBJECT_GAME_1_SCALE
        
        XCTAssertEqual(currentScale, constantScale)
    }
    
    func testObjectGame2Scale(){
        let currentScale: CGFloat = 1.3
        let constantScale = OBJECT_GAME_2_SCALE
        
        XCTAssertEqual(currentScale, constantScale)
    }
    
    func testObjectGame3Scale(){
        let currentScale: CGFloat = 1
        let constantScale = OBJECT_GAME_3_SCALE
        
        XCTAssertEqual(currentScale, constantScale)
    }
    
    // MARK: - Error rows
    func testModelText(){
        let currentText = "model is not nil"
        let constantText = MODEL_IS_NOT_NIL
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testViewText(){
        let currentText = "view is not nil"
        let constantText = VIEW_IS_NOT_NIL
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testPresenterText(){
        let currentText = "presenter is not nil"
        let constantText = PRESENTER_IS_NOT_NIL
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testPouterText(){
        let currentText = "router is not nil"
        let constantText = ROUTER_IS_NOT_NIL
        
        XCTAssertEqual(currentText, constantText)
    }
    
    // MARK: - App Strings
    func testRusAlphabet(){
        let currentText = "аАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ"
        let constantText = RUS_ALPHABET
        
        XCTAssertEqual(currentText, constantText)
    }
   
    func testKeyName(){
        let currentText = "name"
        let constantText = KEY_NAME
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testKeyImage(){
        let currentText = "image"
        let constantText = KEY_IMAGE
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testKeyOneSyllable(){
        let currentText = "firstSyllable"
        let constantText = KEY_ONE_SYLLABLE
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testKeyTwoSyllable(){
        let currentText = "secondSyllable"
        let constantText = KEY_TWO_SYLLABLE
        
        XCTAssertEqual(currentText, constantText)
    }
    
    func testKeyThreeSyllable(){
        let currentText = "thirdSyllable"
        let constantText = KEY_THREE_SYLLABLE
        
        XCTAssertEqual(currentText, constantText)
    }
       
    func testKeyTypeSound(){
        let currentText = "typeSound"
        let constantText = KEY_TYPE_SOUND
        
        XCTAssertEqual(currentText, constantText)
    }
    
    
    // MARK: - Object name
    func testObjectName1(){
        let currentName = "object1"
        let constantName = OBJECT_1
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testObjectName2(){
        let currentName = "object2"
        let constantName = OBJECT_2
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testObjectName3(){
        let currentName = "object3"
        let constantName = OBJECT_3
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testObjectName4(){
        let currentName = "object4"
        let constantName = OBJECT_4
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testObjectName5(){
        let currentName = "object5"
        let constantName = OBJECT_5
        
        XCTAssertEqual(currentName, constantName)
    }
    
    func testObject1Game1Name(){
        let currentObject = "object1"
        let constantObject = OBJECT_1_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject2Game1Name(){
        let currentObject = "object2"
        let constantObject = OBJECT_2_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject3Game1Name(){
        let currentObject = "object3"
        let constantObject = OBJECT_3_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject4Game1Name(){
        let currentObject = "object4"
        let constantObject = OBJECT_4_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject5Game1Name(){
        let currentObject = "object5"
        let constantObject = OBJECT_5_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    
    func testObject1Game2Name(){
        let currentObject = "object1"
        let constantObject = OBJECT_1_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject2Game2Name(){
        let currentObject = "object2"
        let constantObject = OBJECT_2_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject3Game2Name(){
        let currentObject = "object3"
        let constantObject = OBJECT_3_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject4Game2Name(){
        let currentObject = "object4"
        let constantObject = OBJECT_4_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject5Game2Name(){
        let currentObject = "object5"
        let constantObject = OBJECT_5_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject1Game3Name(){
        let currentObject = "object1"
        let constantObject = OBJECT_1_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject2Game3Name(){
        let currentObject = "object2"
        let constantObject = OBJECT_2_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject3Game3Name(){
        let currentObject = "object3"
        let constantObject = OBJECT_3_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject4Game3Name(){
        let currentObject = "object4"
        let constantObject = OBJECT_4_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    func testObject5Game3Name(){
        let currentObject = "object5"
        let constantObject = OBJECT_5_GAME_1_NAME
        
        XCTAssertEqual(currentObject, constantObject)
    }
    
    // MARK: - No name
    func testNoName(){
        let currentText = "//*"
        let constantText = NO_NAME
        
        XCTAssertEqual(currentText, constantText)
    }
    
    // MARK: - Arrays
    func testArrayNumbersImages(){
        let currentArray = [#imageLiteral(resourceName: "numberZeroImage"),#imageLiteral(resourceName: "numberOneImage"),#imageLiteral(resourceName: "numberTwoImage"),#imageLiteral(resourceName: "numberThreeImage"),#imageLiteral(resourceName: "numberFourImage"),#imageLiteral(resourceName: "numberFiveImage"),#imageLiteral(resourceName: "numberSixImage"),#imageLiteral(resourceName: "numberSevenImage"),#imageLiteral(resourceName: "numberEightImage"),#imageLiteral(resourceName: "numberNineImage")]
        let constantArray = ARRAY_NUMBERS_IMAGES
        
        XCTAssertEqual(currentArray, constantArray)
    }
    
    func testArraySketchNumbersImages(){
        let currentArray = [#imageLiteral(resourceName: "sketchNumberZero"),#imageLiteral(resourceName: "sketchNumberOne"),#imageLiteral(resourceName: "sketchNumberTwo"),#imageLiteral(resourceName: "sketchNumberThree"),#imageLiteral(resourceName: "sketchNumberFour"),#imageLiteral(resourceName: "sketchNumberFive"),#imageLiteral(resourceName: "sketchNumberSix"),#imageLiteral(resourceName: "sketchNumberSeven"),#imageLiteral(resourceName: "sketchNumberEight"),#imageLiteral(resourceName: "sketchNumberNine")]
        let constantArray = ARRAY_SKETCH_NUMBERS_IMAGES
        
        XCTAssertEqual(currentArray, constantArray)
    }
    
    func testArrayFingerNumbersImages(){
        let currentArray = [#imageLiteral(resourceName: "pictureZeroFingers"),#imageLiteral(resourceName: "pictureOneFingers"),#imageLiteral(resourceName: "pictureTwoFingers"),#imageLiteral(resourceName: "pictureThreeFingers"),#imageLiteral(resourceName: "pictureFourFingers"),#imageLiteral(resourceName: "pictureFiveFingers"),#imageLiteral(resourceName: "pictureSixFingers"),#imageLiteral(resourceName: "pictureSevenFingers"),#imageLiteral(resourceName: "pictureEightFingers"),#imageLiteral(resourceName: "pictureNineFingers")]
        let constantArray = ARRAY_FINGER_NUMERS_IMAGES
        
        XCTAssertEqual(currentArray, constantArray)
    }
}
