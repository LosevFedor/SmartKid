//
//  ExtensionsByHome.swift
//  SmartKid
//
//  Created by Fedor Losev on 22/05/2020.
//  Copyright © 2020 Fedor Losev. All rights reserved.
//

import Foundation

// MARK: - Handlers
extension HomeViewController {
    private func showCurrentNumberImage(index: Int){
        if let currentImageView = homePresenter.getCurrentEnteredUserResult(firsImageView: firstFieldForNumber, secondImageView: secondFieldForNumber, thirdImageView: thirdFieldForNumber){
            currentImageView.image = UIImage(named: homePresenter.arrayFieldWithNumbers[index])
        }
    }
    
    private func showEnabledButtonCheckUserResult(){
        let result = homePresenter.enableButtonCheckUserResult()
        checkUserResultBtn.isEnabled = result
    }
    
    @objc func handlerZeroImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonZero.isHidden = false
        showCurrentNumberImage(index: 0)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerOneImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonOne.isHidden = false
        showCurrentNumberImage(index: 1)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerTwoImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonTwo.isHidden = false
        showCurrentNumberImage(index: 2)
        showEnabledButtonCheckUserResult()

    }
    
    @objc func handlerThreeImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonThree.isHidden = false
        showCurrentNumberImage(index: 3)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerFourImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonFour.isHidden = false
        showCurrentNumberImage(index: 4)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerFiveImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonFive.isHidden = false
        showCurrentNumberImage(index: 5)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerSixImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonSix.isHidden = false
        showCurrentNumberImage(index: 6)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerSevenImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonSeven.isHidden = false
        showCurrentNumberImage(index: 7)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerEightImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonEight.isHidden = false
        showCurrentNumberImage(index: 8)
        showEnabledButtonCheckUserResult()
    }
    
    @objc func handlerNineImagePressed(sender: UITapGestureRecognizer){
        backgroundButtonNine.isHidden = false
        showCurrentNumberImage(index: 9)
        showEnabledButtonCheckUserResult()
    }
}

// MARK: Extension CustomPopUpWindowProtocol
extension HomeViewController: CustomPopUpWindowProtocol{
    func popUpWindowOff(scaleX: CGFloat,
                        scaleY: CGFloat,
                        duration: TimeInterval,
                        alphaHiden: CGFloat) {
        
        UIView.animate(withDuration: duration) { [weak self] in
            guard let self = self else { return }
            self.customAlert.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleY)
            self.customAlert.alpha = alphaHiden
            self.visualEffectView.alpha = alphaHiden
            self.visualEffectView.effect = nil
        }
    }
    
    func popUpWindowOn(scaleX: CGFloat,
                       scaleY: CGFloat,
                       duration: TimeInterval,
                       alphaShow: CGFloat,
                       alphaHiden: CGFloat) {
        
        customAlert.transform = CGAffineTransform.init(scaleX: scaleX, y: scaleY)
        customAlert.alpha = alphaHiden
        UIView.animate(withDuration: duration) { [weak self] in
            guard let self = self else { return }
            self.visualEffectView.effect = self.effect
            self.customAlert.alpha = alphaShow
            self.visualEffectView.alpha = alphaShow
            self.customAlert.transform = CGAffineTransform.identity
        }
    }
}
