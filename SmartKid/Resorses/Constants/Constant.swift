//
//  Constant.swift
//  SmartKid
//
//  Created by Fedor Losev on 06/03/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit


// MARK: - Background music
let APP_BACKGROUND_SOUND_NAME = "appBackgroundMusic"

// MARK: - Content lock sound name
let CONTENT_LOCK_SOUND_NAME = "оформи_подписку"

// MARK: - Line width size
let TWENTY_PX: Float = 20
let TWENTY_FIVE_PX: Float = 25
let THIRTY_PX: Float = 30

// MARK: - Read syllables
let DEAD_FLY_SOUND_NAME = "deadFly"
let WRONG_FLY_SOUND_NAME = "wrongFly"
let BACK_FINGET_IMAGE_NAME = "backFinger"
let BACK_TOMENU_IMAGE_NAME = "backToMenu"
let DURATION_TIME = 0.6

let CHOOSE_DIFFICULTY_SOUND_NAME = "chooseDifficulty"
let CHOOSE_DIFFICULTY_TIME_INTERVAL = 0.4
let UFO_DEAD_SOUND_NAME = "ufoDead"

let FOLDER_EXPLOSION_IMAGE_NAME = "explosionImage"
let BANG_TEXTURE_NAME = "взрыв"

let SYLLABLE_LEVEL_ONE_SOUND_NAME = "syllableLevelOne"
let SYLLABLE_LEVEL_TWO_SOUND_NAME = "syllableLevelTwo"
let SYLLABLE_LEVEL_THREE_SOUND_NAME = "syllableLevelThree"

let SYLLABLE_LEVEL_ONE_TIME_INTERVAL: TimeInterval = 2
let SYLLABLE_LEVEL_TWO_TIME_INTERVAL: TimeInterval = 2
let SYLLABLE_LEVEL_THREE_TIME_INTERVAL: TimeInterval = 2

let SHOW_CURRENT_IMAGE_TIME_INTERVAL: TimeInterval = 1.5
let SHOW_ONE_BUTTON_ACTION_TIME_INTERVAL: TimeInterval = 2.0
let SHOW_TWO_BUTTON_ACTION_TIME_INTERVAL: TimeInterval = 3.5
let SHOW_TOGETHER_BUTTONS_ACTION_TIME_INTERVAL: TimeInterval = 5.5
let CREATE_NEW_SCENE_TIME_INTERVAL: TimeInterval = 8
let TIME_INTERVAL_ZERO: TimeInterval = 0

let SHOW_CURRENT_IMAGE_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 1.5
let SHOW_ONE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 2.0
let SHOW_TWO_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 3.5
let SHOW_THREE_BUTTON_ACTION_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 5.0
let SHOW_TOGETHER_BUTTONS_ACTION_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 6.5
let CREATE_NEW_SCENE_GAME_SCENE_3_TIME_INTERVAL: TimeInterval = 9.0

let BUTTON_ACTION_WITH_DURATION: TimeInterval = 0.5
let BUTTON_ACTION_MIN_DELAY: TimeInterval = 0.5
let BUTTON_ACTION_MAX_DELAY: TimeInterval = 1.5

let REDUCE_WIDTH_SKVIEW_OBJECT_BOARD: CGFloat = 70
let REDUCE_HEIGHT_SKVIEW_OBJECT_BOARD: CGFloat = 150

let OBJECT_GAME_1_DURATION = 0.5
let OBJECT_GAME_2_DURATION = 0.5
let OBJECT_GAME_3_DURATION = 0.5

let OBJECT_TITLE_BELOW: CGPoint = CGPoint(x: 0, y: -30)

let MAX_VELOSITY_OBJECT_GAME_SCENE_1: CGFloat = 60
let MIN_VELOSITY_OBJECT_GAME_SCENE_1: CGFloat = -60

let MAX_VELOSITY_OBJECT_GAME_SCENE_2: CGFloat = 100
let MIN_VELOSITY_OBJECT_GAME_SCENE_2: CGFloat = -100

let MAX_VELOSITY_OBJECT_GAME_SCENE_3: CGFloat = 20
let MIN_VELOSITY_OBJECT_GAME_SCENE_3: CGFloat = -20

let ONE_BTN_TRAVEL_DIRECTION_DEFAULT: CGFloat = -200
let TWO_BTN_TRAVEL_DIRECTION_DEFAULT: CGFloat = 200

let ONE_BTN_TRAVEL_DIRECTION_GAME_3: CGFloat =  200
let TWO_BTN_TRAVEL_DIRECTION_GAME_3: CGFloat =  0
let THREE_BTN_TRAVEL_DIRECTION_GAME_3: CGFloat = -200

// MARK: - Alpha channel
let ALPHA_CHANNEL: CGFloat = 0.8

// MARK: - Plists names
let RS_PLIST = "ReadingSyllables"
let R2S_PLIST = "Reading2Syllables"
let R3S_PLIST = "Reading3Syllables"

let AS_PLIST = "AdditionAndSubtraction"
let ARITHMETIC_CHARACTERS = "ArithmeticCharacters"
let AS_NUMBERS_PLIST = "Numbers"

let PLIST = "plist"

// MARK: - Sounds name
let SOUND_OBJECT_VS_OBJECT = "ufoCrashToUfo"
let SOUND_WRONG_ANSWER = "wrongAnswer.wav"

// MARK: - Numbers
let NUMBER_ZERO = 0
let NUMBER_ONE = 1
let NUMBER_FIVE = 5
let NUMBER_NINE = 9

let INCREASE_BUTTON: CGFloat = 1.07
let DECREASE_BUTTON: CGFloat = 1.0

// MARK: - All categories
let CHOOSE_GAME_TIME_INTERVAL: TimeInterval = 0.4
let CHOOSE_GAME_SOUND_NAME = "chooseGame"

// MARK: - Settings module
let BACKGROUND_MUSIC_OFF_NAME = "фоновая_мелодия_отключена"
let BACKGROUND_MUSIC_ON_NAME = "фоновая_мелодия_включена"
let MAIL_ADDRESS = "developer.smartkid@gmail.com"
let ERROR_MAIL_TITLE = "Упс! Почта не настроена"
let ERROR_MAIL_TEXT = "Настройте устройство для отправки электронной почты"
let OK_BTN = "Ok"

let SUBSCRIBE_USERNAME_TEXT = "Оформите подписку \"УчисьИграй\" на 1 месяц"
let COST_DESCRIPTION_TEXT = "Стоимость подписки"
let WHAT_USER_GET_WHEN_SUBSCRIBE_TEXT = "Оформив подписку вы получите полный доступ к играм: Алфавит, Слоги, Сложение и вычитание, Цифры"
let SUDSCIBE_DESCRIPTION_TEXT = "Оплата будет снята с учетной записи iTunes при подтверждении покупки.Подписка автоматически продлевается, если автоматическое продление не будет отключено по крайней мере за 24 часа до окончания текущего периода. С аккаунта будет взиматься плата за продление в течение 24 часов до окончания текущего периода.Подписки могут управляться пользователем, а автоматическое продление может быть отключено путем перехода к настройкам учетной записи пользователя после покупки."

let DESCRIPTION_LINK_TERM_OF_USE = "Условия использования подписки по аресу https://supportwebpage.wordpress.com/smartkid-terms-of-use/"
let DESCRIPTION_LINK_PRIVACY_POLICY = "Узнать о политике конфиденциальности вы можете по адресу https://supportwebpage.wordpress.com/smartkid-privacy-policy/"

let LINK_TERM_OF_USE = "https://supportwebpage.wordpress.com/smartkid-terms-of-use/"
let LINK_PRIVACY_POLICY = "https://supportwebpage.wordpress.com/smartkid-privacy-policy/"

// MARK: - HomeModule
let SETTINGS_JUST_ADULT = "настройки_только_для_взрослых"
let START_GAME_SOUND_NAME = "startGame"
let START_GAME_SOUND_TIME_INTERVAL: TimeInterval = 0.6
let DURATION_BEFORE_SPEACH_END: TimeInterval = 3.3
let DEFAULD_FIELD_FOR_NUMBER = "fieldForNumbers"
let NAME_IMAGE_NUMBERS_NAME_PLIST = "NameImageNumbers"
let FIELD_WITH_NUMBERS_NAME_PLIST = "FieldWithNumbers"

// MARK: - ABCModule
let DURATION_PLAY_SOUND = 0.3
let ABC_NAME_PLIST = "ABC"
let NO_SUBSCRIPTION_IMAGE_NAME = "noSubscription"
let SHOW_PART_OF_CONTENT = 3 // add

let ROTATE_ZERO = NSNumber(value:0.0)
let ROTATE_TEN = NSNumber(value: 10 * 0.0174533)
let ROTATE_MINUS_TEN = NSNumber(value: -10 * 0.0174533)

// MARK: - NumbersModel and SomeNumbersModel
let YELLOW_PENCIL_SOUND_NAME = "yellowPencil"
let RED_PENCIL_SOUND_NAME = "redPencil"
let BLUE_PENCIL_SOUND_NAME = "bluePencil"
let GREEN_PENCIL_SOUND_NAME = "greenPencil"
let MIDDLE_POINT_SOUND_NAME = "middlePoint"
let SMALL_POINT_SOUND_NAME = "smallPoint"
let BIG_POINT_SOUND_NAME = "bigPoint"
let CLEAR_LINE_SOUND_NAME = "clearLine"
let CLEAR_BOARD_SOUND_NAME = "clearBoard"
let ERASER_SOUND_NAME = "eraser"
let CHOOSE_NUMBER_SOUND_NAME = "chooseNumber"
let CHOSE_NUMBER_TIME_INTERVAL: TimeInterval = 0.4


let DURATION_BEFORE_ANIMATE_BUTON = 0.4
let DURATION_BEFORE_SHOW_SOME_NUMBER = 1.7
let DURATION_PLAY_SOUND_BY_NUMBERS_MODULE = 0.1
let DURATION_WIGLE_ANIMATION_BY_DRAWINGBOARD = 3.5
let DURATION_TRAY_TO_WRATE_NUMBER_INTO_BOUAR = 0.8
let SOUND_DRAW_NUMBER_PLIST = "SoundDrawNumber"
let NUMBER_LONG_NAME_PLIST = "NumbersLongNames"
let NUMBER_SHORT_NAME_PLIST = "NumbersLongNames"
let NUMBER_IMAGES_NAME_PLIST = "NumberImages"
let SKETCH_NUMBER_NAME_PLIST = "SketchNumbers"
let PICTURE_FINGERS_NAME_PLIST = "PictureFingers"
let BACK_BTN_NAME_PLIST = "BackBtn"
let FORWARD_BTN_PLIST = "ForwardBtn"
let SOUND_FINGER_PLIST = "SoundFingers"
let SOUND_NUMBER_PLIST = "SoundNumbers"

let SOME_NUMBER_ROTATE_ZERO = NSNumber(value:0.0)
let SOME_NUMBER_ROTATE_FIVE = NSNumber(value: 5 * 0.0174533)
let SOME_NUMBER_ROTATE_MINUS_FIVE = NSNumber(value: -5 * 0.0174533)

// MARK: - AdditionAndSubtractionModule
let INTERSECTION_AREA_BY_X: CGFloat = -10
let INTERSECTION_AREA_BY_Y: CGFloat = -10

let NEW_CONCATINATE_SOUND_FILE_NAME = "currentSavedArithmeticResultSound.wav"
let DEINIT_ADDITION_AND_SUBTRACTION_MODULE = "deinit AdditionAndSubtractionModule"
let DEFAULD_VIEW_NUMBER = "default viewNumber"
let DEFAULD_VIEW_PICTURE = "default viewPicture"

let HOW_MUCH_WILL_SOUND_IMAGE = "howMuchWill"
let QUESTION_SOUND_IMAGE = "вопрос"

let NIL_CHARACTER = "nil character"
let NOT_FIND_ARITHMETIC_CHARACTERS_PLIST = "Cannot find path to ArithmeticCharacters.plist"
let NO_CHARACTERS = "No character"

let EQUAL_SOUND = "равно"
let SOUND_TYPE = "wav"

let WINNER_SOUND_PLIST = "WinnerSounds"
let LOSE_SOUND_PLIST = "LoseSounds"


let π = CGFloat(Double.pi)

// MARK: - Posituins
let BACKGROUND_Z_POSITION: CGFloat = -1
let OBJECT_Z_POSITION: CGFloat = 1

// MARK: - Anchor Point
let BACKGROUND_ANCHOR_POINT = CGPoint(x: 0.5, y: 0.5)

// MARK: - Aspect Ratio
let MAX_ASPECT_RATIO: CGFloat = 16.0/9.0

// MARK: - Scale
let OBJECT_GAME_1_SCALE: CGFloat = 1.0
let OBJECT_GAME_2_SCALE: CGFloat = 1.0
let OBJECT_GAME_3_SCALE: CGFloat = 1.0

// MARK: - Error rows
let MODEL_IS_NOT_NIL = "model is not nil"
let VIEW_IS_NOT_NIL = "view is not nil"
let PRESENTER_IS_NOT_NIL = "presenter is not nil"
let ROUTER_IS_NOT_NIL = "router is not nil"

// MARK: - App Strings
let RUS_ALPHABET = "аАбБвВгГдДеЕёЁжЖзЗиИйЙкКлЛмМнНоОпПрРсСтТуУфФхХцЦчЧшШщЩъЪыЫьЬэЭюЮяЯ"

let KEY_NAME = "name"
let KEY_IMAGE = "image"
let KEY_ONE_SYLLABLE = "firstSyllable"
let KEY_TWO_SYLLABLE = "secondSyllable"
let KEY_THREE_SYLLABLE = "thirdSyllable"
let KEY_TYPE_SOUND = "typeSound"

let OBJECT_1: String = "object1"
let OBJECT_2: String = "object2"
let OBJECT_3: String = "object3"
let OBJECT_4: String = "object4"
let OBJECT_5: String = "object5"

let OBJECT_1_GAME_1_NAME = OBJECT_1
let OBJECT_2_GAME_1_NAME = OBJECT_2
let OBJECT_3_GAME_1_NAME = OBJECT_3
let OBJECT_4_GAME_1_NAME = OBJECT_4
let OBJECT_5_GAME_1_NAME = OBJECT_5

let OBJECT_1_GAME_2_NAME = OBJECT_1
let OBJECT_2_GAME_2_NAME = OBJECT_2
let OBJECT_3_GAME_2_NAME = OBJECT_3
let OBJECT_4_GAME_2_NAME = OBJECT_4
let OBJECT_5_GAME_2_NAME = OBJECT_5

let OBJECT_1_GAME_3_NAME = OBJECT_1
let OBJECT_2_GAME_3_NAME = OBJECT_2
let OBJECT_3_GAME_3_NAME = OBJECT_3
let OBJECT_4_GAME_3_NAME = OBJECT_4
let OBJECT_5_GAME_3_NAME = OBJECT_5

let NO_NAME = "//*"

// MARK: - Arrays
let ARRAY_NUMBERS_IMAGES = [#imageLiteral(resourceName: "numberZeroImage"),#imageLiteral(resourceName: "numberOneImage"),#imageLiteral(resourceName: "numberTwoImage"),#imageLiteral(resourceName: "numberThreeImage"),#imageLiteral(resourceName: "numberFourImage"),#imageLiteral(resourceName: "numberFiveImage"),#imageLiteral(resourceName: "numberSixImage"),#imageLiteral(resourceName: "numberSevenImage"),#imageLiteral(resourceName: "numberEightImage"),#imageLiteral(resourceName: "numberNineImage")]
let ARRAY_SKETCH_NUMBERS_IMAGES = [#imageLiteral(resourceName: "sketchNumberZero"),#imageLiteral(resourceName: "sketchNumberOne"),#imageLiteral(resourceName: "sketchNumberTwo"),#imageLiteral(resourceName: "sketchNumberThree"),#imageLiteral(resourceName: "sketchNumberFour"),#imageLiteral(resourceName: "sketchNumberFive"),#imageLiteral(resourceName: "sketchNumberSix"),#imageLiteral(resourceName: "sketchNumberSeven"),#imageLiteral(resourceName: "sketchNumberEight"),#imageLiteral(resourceName: "sketchNumberNine")]
let ARRAY_FINGER_NUMERS_IMAGES = [#imageLiteral(resourceName: "pictureZeroFingers"), #imageLiteral(resourceName: "pictureOneFingers"), #imageLiteral(resourceName: "pictureTwoFingers"), #imageLiteral(resourceName: "pictureThreeFingers"), #imageLiteral(resourceName: "pictureFourFingers"), #imageLiteral(resourceName: "pictureFiveFingers"), #imageLiteral(resourceName: "pictureSixFingers"), #imageLiteral(resourceName: "pictureSevenFingers"), #imageLiteral(resourceName: "pictureEightFingers"), #imageLiteral(resourceName: "pictureNineFingers")]

