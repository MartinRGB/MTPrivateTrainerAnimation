//
//  ViewController.swift
//  Trainer
//
//  Created by KingMartin on 15/11/11.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit

class OnBoardingViewController: UIViewController {
    
    //######## Delcare MARK:Delcare constants & variable ########
    let card0:UIImageView! = UIImageView()
    let card1:UIImageView! = UIImageView()
    let card2:UIImageView! = UIImageView()
    let card3:UIImageView! = UIImageView()
    let bgDown:UIImageView! = UIImageView()
    let bgUp:UIImageView! = UIImageView()
    
    let arrow:UIImageView! = UIImageView()
    let explore:UIImageView! = UIImageView()
    
    let wave:CAShapeLayer! = CAShapeLayer()
    let waveforCard:CAShapeLayer! = CAShapeLayer()
    var rectangleFABLayer:CAShapeLayer! = CAShapeLayer()
    var rectangleBlurFABLayer:CAShapeLayer! = CAShapeLayer()
    
    //var maskPath:UIBezierPath! = UIBezierPath()
    //var maskPathforCard:UIBezierPath! = UIBezierPath()
    var rectanglePath:UIBezierPath! = UIBezierPath()
    var rectangleBlurPath:UIBezierPath! = UIBezierPath()
    
    
    let waveMaskView:UIView! = UIView()
    let waveMaskViewforCard:UIView! = UIView()
    let cardContainer:UIView! = UIView()
    let containerViewForFAB:UIView! = UIView()
    
    let tapRec:UITapGestureRecognizer = UITapGestureRecognizer()
    
    var repeatNumber:CGFloat = 0.026
    
    
    //######## MARK:ViewDidLoad ########
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    //######## MARK:ViewWillAppear ########
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        setup()
        animationSetup()
        drawFABinView()
        animationFABSetup()
        
    }

    //######## Setup MARK:Setup Asset ########
    func setup(){
        
        // MARK: Wave Background
        bgDown.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        bgDown.image = UIImage(named: "bgDown")
        self.view.addSubview(bgDown)
        
        bgUp.frame = CGRectMake(0,0,self.view.frame.size.width * 2.965,self.view.frame.size.height*1.043)
        bgUp.image = UIImage(named: "RealBG")
        self.view.addSubview(bgUp)
        
        
        
        // MARK: Card
        let cardXPosition = 1.08 * self.view.frame.size.width
        let cardWidth = 0.859 * self.view.frame.size.width
        let cardHeight = 0.216 * self.view.frame.size.height
        
        // MARK: Container for Card
        cardContainer.frame = CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)
        self.view.addSubview(cardContainer)
        
        card1.frame = CGRectMake(cardXPosition, 0.166 * self.view.frame.size.height, cardWidth, cardHeight)
        card1.image = UIImage(named: "card1")
        cardContainer.addSubview(card1)
        
        card2.frame = CGRectMake(cardXPosition, 0.398 * self.view.frame.size.height, cardWidth, cardHeight)
        card2.image = UIImage(named: "card2")
        cardContainer.addSubview(card2)
        
        card3.frame = CGRectMake(cardXPosition, 0.628 * self.view.frame.size.height, cardWidth, cardHeight)
        card3.image = UIImage(named: "card3")
        cardContainer.addSubview(card3)
        
        // MARK:Add bezierpath to CAShaplyer then to UIView(as maskView)
        self.wave.path = createOriginalBGMask()
        wave.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        wave.frame = CGRectMake(0,0,self.view.frame.size.width,0.954 * self.view.frame.height)
        
        self.waveforCard.path = createCardMask()
        waveforCard.fillColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1).CGColor
        waveforCard.frame = CGRectMake(0,0,self.view.frame.size.width,0.954 * self.view.frame.height)
        
        
        
        waveMaskView.frame = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        waveMaskView.layer.addSublayer(wave)
        
        waveMaskViewforCard.frame = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        waveMaskViewforCard.layer.addSublayer(waveforCard)
        
        
        bgUp.maskView = waveMaskView
        cardContainer.maskView = waveMaskViewforCard
        
        // MARK: Text
        card0.frame = CGRectMake(1.096 * self.view.frame.size.width , 0.048 * self.view.frame.size.height, 0.808 * self.view.frame.size.width, 0.068 * self.view.frame.size.height)
        card0.image = UIImage(named: "card0")
        self.view.insertSubview(card0, aboveSubview: bgUp)
        
        
    }
    
    //######## Anim MARK:Setup Animation ########
    func animationSetup(){
        
        let initTime = CACurrentMediaTime() + 0.45
        
        //0
        let card0CommonAnimx = CABasicAnimation(keyPath: "position.x")
        card0CommonAnimx.beginTime = initTime
        card0CommonAnimx.duration = 0.8
        card0CommonAnimx.toValue = self.view.frame.width/2
        card0CommonAnimx.removedOnCompletion = false
        card0CommonAnimx.autoreverses = false
        card0CommonAnimx.fillMode = kCAFillModeForwards
        card0CommonAnimx.timingFunction = CAMediaTimingFunction(controlPoints: 0.0198866546154, 0.73028874407181, 0.35400216579437, 1)
        
        card0.layer.addAnimation(card0CommonAnimx, forKey: "card0Positionx")
        
        let card0CommonAnims = CABasicAnimation(keyPath: "transform")
        card0CommonAnims.beginTime = initTime
        card0CommonAnims.duration = 0.8
        card0CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.15, 0.95, 1.0))
        card0CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
        card0CommonAnims.removedOnCompletion = false
        card0CommonAnims.autoreverses = false
        card0CommonAnims.fillMode = kCAFillModeForwards
        card0CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.33333333, 0, 0.66666667, 1)
        
        card0.layer.addAnimation(card0CommonAnims, forKey: "card0Positions")
        
        //1
        let card1CommonAnimx = CABasicAnimation(keyPath: "position.x")
        card1CommonAnimx.beginTime = initTime + 4/30
        card1CommonAnimx.duration = 0.8
        card1CommonAnimx.toValue = self.view.frame.width/2
        card1CommonAnimx.removedOnCompletion = false
        card1CommonAnimx.autoreverses = false
        card1CommonAnimx.fillMode = kCAFillModeForwards
        card1CommonAnimx.timingFunction = CAMediaTimingFunction(controlPoints: 0.0198866546154, 0.73028874407181, 0.35400216579437, 1)
        
        card1.layer.addAnimation(card1CommonAnimx, forKey: "card1Positionx")
        
        let card1CommonAnims = CABasicAnimation(keyPath: "transform")
        card1CommonAnims.beginTime = initTime + 4/30
        card1CommonAnims.duration = 0.8
        card1CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.15, 0.95, 1.0))
        card1CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
        card1CommonAnims.removedOnCompletion = false
        card1CommonAnims.autoreverses = false
        card1CommonAnims.fillMode = kCAFillModeForwards
        card1CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.33333333, 0, 0.66666667, 1)
        
        card1.layer.addAnimation(card1CommonAnims, forKey: "card1Positions")
        
        //2
        let card2CommonAnimx = CABasicAnimation(keyPath: "position.x")
        card2CommonAnimx.beginTime = initTime + 8/30
        card2CommonAnimx.duration = 0.8
        card2CommonAnimx.toValue = self.view.frame.width/2
        card2CommonAnimx.removedOnCompletion = false
        card2CommonAnimx.autoreverses = false
        card2CommonAnimx.fillMode = kCAFillModeForwards
        card2CommonAnimx.timingFunction = CAMediaTimingFunction(controlPoints: 0.0198866546154, 0.73028874407181, 0.35400216579437, 1)
        
        card2.layer.addAnimation(card2CommonAnimx, forKey: "card2Positionx")
        
        let card2CommonAnims = CABasicAnimation(keyPath: "transform")
        card2CommonAnims.beginTime = initTime + 8/30
        card2CommonAnims.duration = 0.8
        card2CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.15, 0.95, 1.0))
        card2CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
        card2CommonAnims.removedOnCompletion = false
        card2CommonAnims.autoreverses = false
        card2CommonAnims.fillMode = kCAFillModeForwards
        card2CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.33333333, 0, 0.66666667, 1)
        
        card2.layer.addAnimation(card2CommonAnims, forKey: "card2Positions")
        
        //3
        let card3CommonAnimx = CABasicAnimation(keyPath: "position.x")
        card3CommonAnimx.beginTime = initTime + 12/30
        card3CommonAnimx.duration = 0.8
        card3CommonAnimx.toValue = self.view.frame.width/2
        card3CommonAnimx.removedOnCompletion = false
        card3CommonAnimx.autoreverses = false
        card3CommonAnimx.fillMode = kCAFillModeForwards
        card3CommonAnimx.timingFunction = CAMediaTimingFunction(controlPoints: 0.0198866546154, 0.73028874407181, 0.35400216579437, 1)
        
        card3.layer.addAnimation(card3CommonAnimx, forKey: "card3Positionx")
        
        let card3CommonAnims = CABasicAnimation(keyPath: "transform")
        card3CommonAnims.beginTime = initTime + 12/30
        card3CommonAnims.duration = 0.8
        card3CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.15, 0.95, 1.0))
        card3CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
        card3CommonAnims.removedOnCompletion = false
        card3CommonAnims.autoreverses = false
        card3CommonAnims.fillMode = kCAFillModeForwards
        card3CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.33333333, 0, 0.66666667, 1)
        
        card3.layer.addAnimation(card3CommonAnims, forKey: "transform")
        
        //maskBG
        let maskViewY = CABasicAnimation(keyPath: "bounds")
        let currentYPositon = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        let afterYPosition = CGRectMake(0,0,self.view.frame.width,0.954 * self.view.frame.height)
        maskViewY.beginTime = initTime
        maskViewY.duration = 0.8 + 1/30
        maskViewY.fromValue = NSValue(CGRect:afterYPosition)
        maskViewY.toValue = NSValue(CGRect:currentYPositon)
        maskViewY.removedOnCompletion = false
        maskViewY.autoreverses = false
        maskViewY.fillMode = kCAFillModeForwards
        maskViewY.timingFunction = CAMediaTimingFunction(controlPoints: 0.10197902679443, 0.4998767276381, 0.53825780883972, 1)
        
        waveMaskView.layer.addAnimation(maskViewY, forKey: "maskViewY")
        
        //maskCard
        let maskCardViewY = CABasicAnimation(keyPath: "bounds")
        let currentYPositonCard = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        let afterYPositionCard = CGRectMake(0,0,self.view.frame.width,0.954 * self.view.frame.height)
        maskCardViewY.beginTime = initTime + 0.1
        maskCardViewY.duration = 0.8 + 1/30
        maskCardViewY.fromValue = NSValue(CGRect:afterYPositionCard)
        maskCardViewY.toValue = NSValue(CGRect:currentYPositonCard)
        maskCardViewY.removedOnCompletion = false
        maskCardViewY.autoreverses = false
        maskCardViewY.fillMode = kCAFillModeForwards
        maskCardViewY.timingFunction = CAMediaTimingFunction(controlPoints: 0.10197902679443, 0.4998767276381, 0.53825780883972, 1)
        
        waveMaskViewforCard.layer.addAnimation(maskCardViewY, forKey: "maskViewY")
        
    }
    
    //######## Setup MARK:Draw FAB Button ########
    func drawFABinView(){
        
        let context = UIGraphicsGetCurrentContext()
        
        //Container for FAB
        
        containerViewForFAB.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281, 0.873 * self.view.frame.size.height, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.155)
        self.view.addSubview(containerViewForFAB)
        
        //FAB Path
        rectanglePath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084, self.view.frame.size.height * 0.883, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        CGContextSaveGState(context)
        rectanglePath.fill()
        
        rectangleBlurPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084+3, self.view.frame.size.height * 0.883+4, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        CGContextSaveGState(context)
        rectangleBlurPath.fill()
        
        //ShapeLayer(Base & Blur)
        self.rectangleFABLayer.path = rectanglePath.CGPath
        rectangleFABLayer.fillColor = UIColor(red: 0.482, green: 0.741, blue: 0.894, alpha: 1.000).CGColor
        rectangleFABLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        rectangleBlurFABLayer.path = rectangleBlurPath.CGPath
        rectangleBlurFABLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).CGColor
        rectangleBlurFABLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        containerViewForFAB.layer.addSublayer(rectangleBlurFABLayer)
        containerViewForFAB.layer.addSublayer(rectangleFABLayer)
        
        //Arrow & Text Image
        arrow.image = UIImage(named: "Arrow")
        arrow.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.0425, self.view.frame.size.height * 0.918, self.view.frame.size.width * 0.085, self.view.frame.size.width * 0.045)
        
        containerViewForFAB.addSubview(arrow)
        
        explore.image = UIImage(named: "Explore")
        explore.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.3595, self.view.frame.size.height * 0.921, self.view.frame.size.width * 0.211, self.view.frame.size.width * 0.067)
        explore.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        
        
        //Add to Superview & Setting
        containerViewForFAB.addSubview(explore)
        containerViewForFAB.alpha = 0.8
        
        CGContextRestoreGState(context)
        
    }
    
    //######## Anim MARK:Animate FAB Button ########
    func animationFABSetup() {
        
        let initTime = CACurrentMediaTime() + 0.45 + 1/6
        
        //Ball
        let containerViewForFABY = CABasicAnimation(keyPath: "bounds")
        let currentYPositonCard = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281, 0.908 * self.view.frame.size.height, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.119)
        let afterYPositionCard = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281, 0.686 * self.view.frame.size.height, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.119)
        containerViewForFABY.beginTime = initTime
        containerViewForFABY.duration = 1 + 14/30
        containerViewForFABY.fromValue = NSValue(CGRect:afterYPositionCard)
        containerViewForFABY.toValue = NSValue(CGRect:currentYPositonCard)
        containerViewForFABY.removedOnCompletion = false
        containerViewForFABY.autoreverses = false
        containerViewForFABY.fillMode = kCAFillModeForwards
        containerViewForFABY.timingFunction = CAMediaTimingFunction(controlPoints: 0.09147787840335, 1.71311978494373, 0.17607621676994, 0.83763306077712)
        
        containerViewForFAB.layer.addAnimation(containerViewForFABY, forKey: "maskViewY")
        
        //Btn
        let btnPath = CABasicAnimation(keyPath: "path")
        let fromPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084, self.view.frame.size.height * 0.883, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        
        let toPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281, self.view.frame.size.height * (0.883+0.025), self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.118), cornerRadius: self.view.frame.size.width * 0.118)
        
        btnPath.beginTime = initTime + 5/6
        btnPath.duration = 0.5
        btnPath.fromValue = fromPath.CGPath
        btnPath.toValue = toPath.CGPath
        btnPath.removedOnCompletion = false
        btnPath.autoreverses = false
        btnPath.fillMode = kCAFillModeForwards
        btnPath.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        rectangleFABLayer.addAnimation(btnPath, forKey: "path")
        
        let btnblurPath = CABasicAnimation(keyPath: "path")
        let blurfromPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084+3, self.view.frame.size.height * 0.883+4, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        
        let blurtoPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281+3, self.view.frame.size.height * (0.883+0.025)+4, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.118), cornerRadius: self.view.frame.size.width * 0.118)
        
        btnblurPath.beginTime = initTime + 5/6
        btnblurPath.duration = 0.5
        btnblurPath.fromValue = blurfromPath.CGPath
        btnblurPath.toValue = blurtoPath.CGPath
        btnblurPath.removedOnCompletion = false
        btnblurPath.autoreverses = false
        btnblurPath.fillMode = kCAFillModeForwards
        btnblurPath.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        rectangleBlurFABLayer.addAnimation(btnblurPath, forKey: "path")
        
        //Arrow
        let arrowscale = CABasicAnimation(keyPath: "transform")
        arrowscale.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1, 1, 1.0))
        arrowscale.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0))
        
        arrowscale.beginTime = initTime + 5/6
        arrowscale.duration = 2/3
        arrowscale.removedOnCompletion = false
        arrowscale.autoreverses = false
        arrowscale.fillMode = kCAFillModeForwards
        arrowscale.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        arrow.layer.addAnimation(arrowscale, forKey: "path")
        
        let arrowbounds = CABasicAnimation(keyPath: "position")
        arrowbounds.beginTime = initTime + 5/6
        arrowbounds.duration = 2/3
        arrowbounds.toValue = NSValue(CGPoint:CGPointMake(self.view.frame.width * 0.712, self.view.frame.height * 0.942))
        arrowbounds.removedOnCompletion = false
        arrowbounds.autoreverses = false
        arrowbounds.fillMode = kCAFillModeForwards
        arrowbounds.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        arrow.layer.addAnimation(arrowbounds, forKey: "maskViewY")
        
        //Text
        let textpositon = CABasicAnimation(keyPath: "position")
        textpositon.beginTime = initTime + 5/6
        textpositon.duration = 2/3
        textpositon.toValue = NSValue(CGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.height * 0.942))
        textpositon.removedOnCompletion = false
        textpositon.autoreverses = false
        textpositon.fillMode = kCAFillModeForwards
        textpositon.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        explore.layer.addAnimation(textpositon, forKey: "maskViewY")
        
        //Setting Tapping Event
        containerViewForFAB.addGestureRecognizer(tapRec)
        tapRec.addTarget(self, action: "tappedFAB")
        
        //Wave Loop Shaking
        
        UIView.animateWithDuration(3, delay: 0.2, options: [.Autoreverse,.Repeat,.CurveEaseOut], animations: {
            
            self.waveMaskView.frame = CGRectMake(0,-(0.970) * self.view.frame.height,self.view.frame.width,(0.970) * self.view.frame.height)
            
        
        }, completion: nil)
       
    }
    
    //######## Delegate MARK:tapped FAB ########
    func tappedFAB(){
        
        containerViewForFAB.userInteractionEnabled = false
        print("tapped")
        
        //One:AddKeyframeAnimation
        let pathAnim = CAKeyframeAnimation(keyPath: "path")
        pathAnim.duration = 1.7
        pathAnim.keyTimes = [0,0.388,1]
        pathAnim.values = [createOriginalBGMask(),createOneChangedBGMask(),createTwoChangedBGMask()]
        pathAnim.timingFunctions = [CAMediaTimingFunction(controlPoints: 0.33, 0, 0.66, 1),CAMediaTimingFunction(controlPoints: 0.33, 0, 0.83, 1)]
        pathAnim.removedOnCompletion = false
        pathAnim.autoreverses = false
        pathAnim.fillMode = kCAFillModeForwards
        pathAnim.additive = true
        
        wave.addAnimation(pathAnim, forKey: "Path")
        
        //Two:maskBG
        
        //Y Position part
        self.delay(0.5, closure: { () -> () in
            let maskViewY = CABasicAnimation(keyPath: "transform.translation.y")
            maskViewY.duration = 1.2
            maskViewY.fromValue = 0.954 * self.view.frame.height
            maskViewY.toValue = 0.0897 * self.view.frame.height
            maskViewY.removedOnCompletion = false
            maskViewY.autoreverses = false
            maskViewY.fillMode = kCAFillModeForwards
            maskViewY.timingFunction = CAMediaTimingFunction(controlPoints: 0.47806126521184, 0.19381397222118, 0.11399554528546, 1.23447799181117)
            
            self.waveMaskView.layer.addAnimation(maskViewY, forKey: "maskViewY")
        })
        
        //Three: FAB & BLur Shape Animation
        let btnPath = CABasicAnimation(keyPath: "path")
        let fromPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281, self.view.frame.size.height * (0.883+0.025), self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.118), cornerRadius: self.view.frame.size.width * 0.118)
        
        let toPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.08, self.view.frame.size.height * (0.883+0.0125), self.view.frame.size.width * 0.16, self.view.frame.size.width * 0.16), cornerRadius: self.view.frame.size.width * 0.16)
        
        btnPath.duration = 0.5
        btnPath.fromValue = fromPath.CGPath
        btnPath.toValue = toPath.CGPath
        btnPath.removedOnCompletion = false
        btnPath.autoreverses = false
        btnPath.fillMode = kCAFillModeForwards
        btnPath.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.83, 1)
        
        rectangleFABLayer.addAnimation(btnPath, forKey: "path")
        
        let btnblurPath = CABasicAnimation(keyPath: "path")
        let blurfromPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.281+3, self.view.frame.size.height * (0.883+0.025)+4, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.118), cornerRadius: self.view.frame.size.width * 0.118)
        
        let blurtoPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.08+3, self.view.frame.size.height * (0.883+0.0125)+4, self.view.frame.size.width * 0.16, self.view.frame.size.width * 0.16), cornerRadius: self.view.frame.size.width * 0.16)
        
        btnblurPath.duration = 0.5
        btnblurPath.fromValue = blurfromPath.CGPath
        btnblurPath.toValue = blurtoPath.CGPath
        btnblurPath.removedOnCompletion = false
        btnblurPath.autoreverses = false
        btnblurPath.fillMode = kCAFillModeForwards
        btnblurPath.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.83, 1)
        
        rectangleBlurFABLayer.addAnimation(btnblurPath, forKey: "path")
        
        //Four: FAB & BLur Position Animation
        let containerViewForFABX = CABasicAnimation(keyPath: "bounds")
        let changedBounds = CGRectMake(-self.view.frame.size.width * 0.099, 0.923 * self.view.frame.size.height, self.view.frame.size.width * 0.562, self.view.frame.size.width * 0.119)
        containerViewForFABX.duration = 0.5
        containerViewForFABX.toValue = NSValue(CGRect:changedBounds)
        containerViewForFABX.removedOnCompletion = false
        containerViewForFABX.autoreverses = false
        containerViewForFABX.fillMode = kCAFillModeForwards
        containerViewForFABX.timingFunction = CAMediaTimingFunction(controlPoints: 0.33, 0, 0.66, 1)
        
        containerViewForFAB.layer.addAnimation(containerViewForFABX, forKey: "Position")
        
        //Five:Text & arrow scale & position
        let smallScale = CABasicAnimation(keyPath: "transform")
        smallScale.duration = 0.5
        smallScale.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.1, 0.1, 1.0))
        smallScale.removedOnCompletion = false
        smallScale.autoreverses = false
        smallScale.fillMode = kCAFillModeForwards
        smallScale.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        arrow.layer.addAnimation(smallScale, forKey: "scale")
        explore.layer.addAnimation(smallScale, forKey: "scale")
        
        let arrowPosition = CABasicAnimation(keyPath: "position")
        arrowPosition.duration = 0.5
        arrowPosition.fromValue = NSValue(CGPoint:CGPointMake(self.view.frame.width * 0.712, self.view.frame.height * 0.942))
        arrowPosition.toValue = NSValue(CGPoint:CGPointMake(self.view.frame.width * 0.5, self.view.frame.height * 0.942))
        arrowPosition.removedOnCompletion = false
        arrowPosition.autoreverses = false
        arrowPosition.fillMode = kCAFillModeForwards
        arrowPosition.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        arrow.layer.addAnimation(arrowPosition, forKey: "maskViewY")
        
        //Six:Add scale & rotate
        let addImageView:UIImageView = UIImageView()
        addImageView.image = UIImage(named: "Add")
        addImageView.frame = CGRectMake(self.view.frame.size.width * (0.5 - 0.0826/2) , 0.918 * self.view.frame.size.height, 0.0826 * self.view.frame.size.width, 0.0826 * self.view.frame.size.width)
        addImageView.transform = CGAffineTransformMakeScale(0, 0)
        containerViewForFAB.addSubview(addImageView)
        
        
        let addScale = CABasicAnimation(keyPath: "transform.scale")
        addScale.beginTime = CACurrentMediaTime() + 1/6
        addScale.duration = 0.6
        addScale.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(0, 0, 1.0))
        addScale.toValue = NSValue(CATransform3D:CATransform3DMakeScale(1, 1, 1.0))
        addScale.removedOnCompletion = false
        addScale.autoreverses = false
        addScale.fillMode = kCAFillModeForwards
        addScale.timingFunction = CAMediaTimingFunction(controlPoints: 0.45743735297974, 0.651, 0.31650201812927, 1.25)
        
        addImageView.layer.addAnimation(addScale, forKey: "Scale")
        
        let addRotation = CABasicAnimation(keyPath: "transform.rotation")
        addRotation.beginTime = CACurrentMediaTime() + 1/6
        addRotation.duration = 38/30
        addRotation.fromValue = CGFloat(M_PI * -1/4)
        addRotation.toValue = CGFloat(M_PI * 1/2)
        addRotation.removedOnCompletion = false
        addRotation.autoreverses = false
        addRotation.fillMode = kCAFillModeForwards
        addRotation.timingFunction = CAMediaTimingFunction(controlPoints: 0.33, 0, 0.66, 1)
        
        addImageView.layer.addAnimation(addRotation, forKey: "Rotation")
        
        //Seven Card Part
        
        //0
        delay(1/3) { () -> () in
            let card0CommonAnimy = CABasicAnimation(keyPath: "position.y")
            card0CommonAnimy.duration = 0.8
            card0CommonAnimy.toValue = -self.view.frame.width * 0.867
            card0CommonAnimy.removedOnCompletion = false
            card0CommonAnimy.autoreverses = false
            card0CommonAnimy.fillMode = kCAFillModeForwards
            card0CommonAnimy.timingFunction = CAMediaTimingFunction(controlPoints: 0.57892719268799, 0.23139206636869, 0.11117681503296, 1.17028867040992)
            
            self.card0.layer.addAnimation(card0CommonAnimy, forKey: "card0Positiony")
            
            let card0CommonAnims = CABasicAnimation(keyPath: "transform")
            card0CommonAnims.duration = 0.5
            card0CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
            card0CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.95, 1.15, 1.0))
            card0CommonAnims.removedOnCompletion = false
            card0CommonAnims.autoreverses = false
            card0CommonAnims.fillMode = kCAFillModeForwards
            card0CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.84, 1)
            
            self.card0.layer.addAnimation(card0CommonAnims, forKey: "card0Positions")
        }
        
        //1
        delay(1/3+1/15) { () -> () in
            
            let card1CommonAnimy = CABasicAnimation(keyPath: "position.y")
            card1CommonAnimy.duration = 0.8
            card1CommonAnimy.toValue = -self.view.frame.width * 0.749
            card1CommonAnimy.removedOnCompletion = false
            card1CommonAnimy.autoreverses = false
            card1CommonAnimy.fillMode = kCAFillModeForwards
            card1CommonAnimy.timingFunction = CAMediaTimingFunction(controlPoints: 0.57892719268799, 0.23139206636869, 0.11117681503296, 1.17028867040992)
            
            self.card1.layer.addAnimation(card1CommonAnimy, forKey: "card1Positiony")
            
            let card1CommonAnims = CABasicAnimation(keyPath: "transform")
            card1CommonAnims.duration = 0.5
            card1CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
            card1CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.95, 1.15, 1.0))
            card1CommonAnims.removedOnCompletion = false
            card1CommonAnims.autoreverses = false
            card1CommonAnims.fillMode = kCAFillModeForwards
            card1CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.84, 1)
            
            self.card1.layer.addAnimation(card1CommonAnims, forKey: "card1Positions")
        }
        
        //2
        delay(1/3+2/15) { () -> () in
            
            let card2CommonAnimy = CABasicAnimation(keyPath: "position.y")
            card2CommonAnimy.duration = 0.8
            card2CommonAnimy.toValue = -self.view.frame.width * 0.517
            card2CommonAnimy.removedOnCompletion = false
            card2CommonAnimy.autoreverses = false
            card2CommonAnimy.fillMode = kCAFillModeForwards
            card2CommonAnimy.timingFunction = CAMediaTimingFunction(controlPoints: 0.57892719268799, 0.23139206636869, 0.11117681503296, 1.17028867040992)
            
            self.card2.layer.addAnimation(card2CommonAnimy, forKey: "card2Positiony")
            
            let card2CommonAnims = CABasicAnimation(keyPath: "transform")
            card2CommonAnims.duration = 0.5
            card2CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
            card2CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.95, 1.15, 1.0))
            card2CommonAnims.removedOnCompletion = false
            card2CommonAnims.autoreverses = false
            card2CommonAnims.fillMode = kCAFillModeForwards
            card2CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.84, 1)
            
            self.card2.layer.addAnimation(card2CommonAnims, forKey: "card2Positions")
        }
        
        delay(1/3+3/15) { () -> () in
            //3
            let card3CommonAnimy = CABasicAnimation(keyPath: "position.y")
            card3CommonAnimy.duration = 0.8
            card3CommonAnimy.toValue = -self.view.frame.width * 0.287
            card3CommonAnimy.removedOnCompletion = false
            card3CommonAnimy.autoreverses = false
            card3CommonAnimy.fillMode = kCAFillModeForwards
            card3CommonAnimy.timingFunction = CAMediaTimingFunction(controlPoints: 0.57892719268799, 0.23139206636869, 0.11117681503296, 1.17028867040992)
            
            self.card3.layer.addAnimation(card3CommonAnimy, forKey: "card3Positiony")
            
            let card3CommonAnims = CABasicAnimation(keyPath: "transform")
            card3CommonAnims.duration = 0.5
            card3CommonAnims.fromValue = NSValue(CATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0))
            card3CommonAnims.toValue = NSValue(CATransform3D:CATransform3DMakeScale(0.95, 1.15, 1.0))
            card3CommonAnims.removedOnCompletion = false
            card3CommonAnims.autoreverses = false
            card3CommonAnims.fillMode = kCAFillModeForwards
            card3CommonAnims.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.84, 1)
            
            self.card3.layer.addAnimation(card3CommonAnims, forKey: "transform")
        }
        
    }
    
    //######## Function MARK:Create Wave Shape Function########
    func createMaskPath(point1:CGPoint,point2:CGPoint,point3:CGPoint,point3cp1:CGPoint,point3cp2:CGPoint,point4:CGPoint,point4cp1:CGPoint,point4cp2:CGPoint,point5:CGPoint,point5cp1:CGPoint,point5cp2:CGPoint,point6:CGPoint,point6cp1:CGPoint,point6cp2:CGPoint,point7:CGPoint,point7cp1:CGPoint,point7cp2:CGPoint,point8:CGPoint,point8cp1:CGPoint,point8cp2:CGPoint,point9:CGPoint,point9cp1:CGPoint,point9cp2:CGPoint,point10:CGPoint,point10cp1:CGPoint,point10cp2:CGPoint) -> UIBezierPath {
        
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath()
        
        path.moveToPoint(point1)
        path.addLineToPoint(point2)
        path.addCurveToPoint(point3, controlPoint1:point3cp1 , controlPoint2:point3cp2)
        path.addCurveToPoint(point4, controlPoint1:point4cp1 , controlPoint2:point4cp2)
        path.addCurveToPoint(point5, controlPoint1:point5cp1 , controlPoint2:point5cp2)
        path.addCurveToPoint(point6, controlPoint1:point6cp1 , controlPoint2:point6cp2)
        path.addCurveToPoint(point7, controlPoint1:point7cp1 , controlPoint2:point7cp2)
        path.addCurveToPoint(point8, controlPoint1:point8cp1 , controlPoint2:point8cp2)
        path.addCurveToPoint(point9, controlPoint1:point9cp1 , controlPoint2:point9cp2)
        path.addCurveToPoint(point10, controlPoint1:point10cp1 , controlPoint2:point10cp2)
        path.closePath()
        UIColor.grayColor().setFill()
        CGContextSaveGState(context)
        path.fill()
        
        CGContextRestoreGState(context)
        return path
    }
    
    //######## Function MARK:Delay Method ########
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    //######## Drawing MARK: BezierDrawing for BG Wave Mask ########
    func createOriginalBGMask() -> CGPathRef{
        
        let point1 = CGPointMake(0, 0)
        let point2 = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let point3 = CGPointMake(375/375 * self.view.frame.size.width, 613/667 * self.view.frame.size.height)
        let point3cp1 = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let point3cp2 = CGPointMake(375/375 * self.view.frame.size.width, 464/667 * self.view.frame.size.height)
        let point4 = CGPointMake(292.27/375 * self.view.frame.size.width, 634.02/667 * self.view.frame.size.height)
        let point4cp1 = CGPointMake(342.06/375 * self.view.frame.size.width, 626.74/667 * self.view.frame.size.height)
        let point4cp2 = CGPointMake(315.32/375 * self.view.frame.size.width, 632.86/667 * self.view.frame.size.height)
        let point5 = CGPointMake(237.73/375 * self.view.frame.size.width, 627.18/667 * self.view.frame.size.height)
        let point5cp1 = CGPointMake(271.75/375 * self.view.frame.size.width, 635.06/667 * self.view.frame.size.height)
        let point5cp2 = CGPointMake(254.16/375 * self.view.frame.size.width, 632.15/667 * self.view.frame.size.height)
        let point6 = CGPointMake(186.45/375 * self.view.frame.size.width, 606.26/667 * self.view.frame.size.height)
        let point6cp1 = CGPointMake(220.02/375 * self.view.frame.size.width, 621.82/667 * self.view.frame.size.height)
        let point6cp2 = CGPointMake(203.66/375 * self.view.frame.size.width, 614.06/667 * self.view.frame.size.height)
        let point7 = CGPointMake(130.81/375 * self.view.frame.size.width, 585.29/667 * self.view.frame.size.height)
        let point7cp1 = CGPointMake(169.45/375 * self.view.frame.size.width, 598.56/667 * self.view.frame.size.height)
        let point7cp2 = CGPointMake(151.62/375 * self.view.frame.size.width, 590.81/667 * self.view.frame.size.height)
        let point8 = CGPointMake(74.57/375 * self.view.frame.size.width, 577.47/667 * self.view.frame.size.height)
        let point8cp1 = CGPointMake(114.29/375 * self.view.frame.size.width, 580.9/667 * self.view.frame.size.height)
        let point8cp2 = CGPointMake(95.9/375 * self.view.frame.size.width, 577.92/667 * self.view.frame.size.height)
        let point9 = CGPointMake(0, 585/667 * self.view.frame.size.height)
        let point9cp1 = CGPointMake(53.07/375 * self.view.frame.size.width, 577.02/667 * self.view.frame.size.height)
        let point9cp2 = CGPointMake(28.58/375 * self.view.frame.size.width, 579.14/667 * self.view.frame.size.height)
        let point10 = CGPointMake(0, 0)
        let point10cp1 = CGPointMake(0, 454.5/667 * self.view.frame.size.height)
        let point10cp2 = CGPointMake(0, 0)
        
        let maskPath:UIBezierPath = createMaskPath(point1,point2: point2,point3: point3,point3cp1: point3cp1,point3cp2: point3cp2,point4: point4,point4cp1: point4cp1,point4cp2: point4cp2,point5: point5,point5cp1: point5cp1,point5cp2: point5cp2,point6: point6,point6cp1: point6cp1,point6cp2: point6cp2,point7: point7,point7cp1: point7cp1,point7cp2: point7cp2,point8: point8,point8cp1: point8cp1,point8cp2: point8cp2,point9: point9,point9cp1: point9cp1,point9cp2: point9cp2,point10: point10,point10cp1: point10cp1,point10cp2: point10cp2)
        
        return maskPath.CGPath
        
    }
    
    //######## Drawing MARK: BezierDrawing for Card Mask ########
    func createCardMask() -> CGPathRef{
        
        let point1 = CGPointMake(0, 0)
        let point2 = CGPointMake(376/375 * self.view.frame.size.width, 0)
        let point3 = CGPointMake(376/375 * self.view.frame.size.width, 614/667 * self.view.frame.size.height)
        let point3cp1 = CGPointMake(376/375 * self.view.frame.size.width, 0)
        let point3cp2 = CGPointMake(376/375 * self.view.frame.size.width, 496/667 * self.view.frame.size.height)
        let point4 = CGPointMake(293.77/375 * self.view.frame.size.width, 635.18/667 * self.view.frame.size.height)
        let point4cp1 = CGPointMake(344.22/375 * self.view.frame.size.width, 629.89/667 * self.view.frame.size.height)
        let point4cp2 = CGPointMake(317.68/375 * self.view.frame.size.width, 635.59/667 * self.view.frame.size.height)
        let point5 = CGPointMake(238.96/375 * self.view.frame.size.width, 624.13/667 * self.view.frame.size.height)
        let point5cp1 = CGPointMake(274.23/375 * self.view.frame.size.width, 634.84/667 * self.view.frame.size.height)
        let point5cp2 = CGPointMake(256.44/375 * self.view.frame.size.width, 630.41/667 * self.view.frame.size.height)
        let point6 = CGPointMake(187.95/375 * self.view.frame.size.width, 602.77/667 * self.view.frame.size.height)
        let point6cp1 = CGPointMake(222.1/375 * self.view.frame.size.width, 618.07/667 * self.view.frame.size.height)
        let point6cp2 = CGPointMake(205.53/375 * self.view.frame.size.width, 610.29/667 * self.view.frame.size.height)
        
        let point7 = CGPointMake(136.66/375 * self.view.frame.size.width, 584.43/667 * self.view.frame.size.height)
        let point7cp1 = CGPointMake(172/375 * self.view.frame.size.width, 595.94/667 * self.view.frame.size.height)
        let point7cp2 =  CGPointMake(155.23/375 * self.view.frame.size.width, 589.33/667 * self.view.frame.size.height)
        let point8 = CGPointMake(84.96/375 * self.view.frame.size.width, 576.58/667 * self.view.frame.size.height)
        let point8cp1 = CGPointMake(120.91/375 * self.view.frame.size.width, 580.28/667 * self.view.frame.size.height)
        let point8cp2 = CGPointMake(103.87/375 * self.view.frame.size.width, 577.36/667 * self.view.frame.size.height)
        
        let point9 = CGPointMake(0, 586.5/667 * self.view.frame.size.height)
        let point9cp1 = CGPointMake(60.27/375 * self.view.frame.size.width, 575.56/667 * self.view.frame.size.height)
        let point9cp2 = CGPointMake(32.39/375 * self.view.frame.size.width, 578.19/667 * self.view.frame.size.height)
        let point10 = CGPointMake(0, 0)
        let point10cp1 = CGPointMake(0, 449/667 * self.view.frame.size.height)
        let point10cp2 = CGPointMake(0, 0)
        
        let maskPathforCard:UIBezierPath = createMaskPath(point1,point2: point2,point3: point3,point3cp1: point3cp1,point3cp2: point3cp2,point4: point4,point4cp1: point4cp1,point4cp2: point4cp2,point5: point5,point5cp1: point5cp1,point5cp2: point5cp2,point6: point6,point6cp1: point6cp1,point6cp2: point6cp2,point7: point7,point7cp1: point7cp1,point7cp2: point7cp2,point8: point8,point8cp1: point8cp1,point8cp2: point8cp2,point9: point9,point9cp1: point9cp1,point9cp2: point9cp2,point10: point10,point10cp1: point10cp1,point10cp2: point10cp2)
        
        return maskPathforCard.CGPath
        
    }
    
    //######## Drawing MARK: BezierDrawing for OneChanged BG Wave Mask ########
    func createOneChangedBGMask() ->CGPathRef{
        
        let onepoint1 = CGPointMake(0, 0)
        let onepoint2 = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let onepoint3 = CGPointMake(461/375 * self.view.frame.size.width, 587/667 * self.view.frame.size.height)
        let onepoint3cp1 = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let onepoint3cp2 = CGPointMake(461/375 * self.view.frame.size.width, 438/667 * self.view.frame.size.height)
        let onepoint4 = CGPointMake(375/375 * self.view.frame.size.width, 614/667 * self.view.frame.size.height)
        let onepoint4cp1 = CGPointMake(428/375 * self.view.frame.size.width, 601/667 * self.view.frame.size.height)
        let onepoint4cp2 = CGPointMake(399/375 * self.view.frame.size.width, 596/667 * self.view.frame.size.height)
        let onepoint5 = CGPointMake(292/375 * self.view.frame.size.width, 649/667 * self.view.frame.size.height)
        let onepoint5cp1 = CGPointMake(354/375 * self.view.frame.size.width, 630/667 * self.view.frame.size.height)
        let onepoint5cp2 = CGPointMake(322/375 * self.view.frame.size.width, 652/667 * self.view.frame.size.height)
        let onepoint6 = CGPointMake(199/375 * self.view.frame.size.width, 640/667 * self.view.frame.size.height)
        let onepoint6cp1 = CGPointMake(260/375 * self.view.frame.size.width, 646/667 * self.view.frame.size.height)
        let onepoint6cp2 = CGPointMake(225/375 * self.view.frame.size.width, 631/667 * self.view.frame.size.height)
        let onepoint7 = CGPointMake(88/375 * self.view.frame.size.width, 640/667 * self.view.frame.size.height)
        let onepoint7cp1 = CGPointMake(173/375 * self.view.frame.size.width, 649/667 * self.view.frame.size.height)
        let onepoint7cp2 = CGPointMake(119/375 * self.view.frame.size.width, 648/667 * self.view.frame.size.height)
        let onepoint8 = CGPointMake(0/375 * self.view.frame.size.width, 568/667 * self.view.frame.size.height)
        let onepoint8cp1 = CGPointMake(63/375 * self.view.frame.size.width, 634/667 * self.view.frame.size.height)
        let onepoint8cp2 = CGPointMake(36/375 * self.view.frame.size.width, 568/667 * self.view.frame.size.height)
        let onepoint9 = CGPointMake(-113.5/375 * self.view.frame.size.width, 578/667 * self.view.frame.size.height)
        let onepoint9cp1 = CGPointMake(-36/375 * self.view.frame.size.width, 568/667 * self.view.frame.size.height)
        let onepoint9cp2 = CGPointMake(-85/375 * self.view.frame.size.width, 572/667 * self.view.frame.size.height)
        let onepoint10 = CGPointMake(0, 0)
        let onepoint10cp1 = CGPointMake(-113.5/375 * self.view.frame.size.width , 447/667 * self.view.frame.size.height)
        let onepoint10cp2 = CGPointMake(0, 0)
        
        let oneChangedBGMask:UIBezierPath = self.createMaskPath(onepoint1,point2: onepoint2,point3: onepoint3,point3cp1: onepoint3cp1,point3cp2: onepoint3cp2,point4: onepoint4,point4cp1: onepoint4cp1,point4cp2: onepoint4cp2,point5: onepoint5,point5cp1: onepoint5cp1,point5cp2: onepoint5cp2,point6: onepoint6,point6cp1: onepoint6cp1,point6cp2: onepoint6cp2,point7: onepoint7,point7cp1: onepoint7cp1,point7cp2: onepoint7cp2,point8: onepoint8,point8cp1: onepoint8cp1,point8cp2: onepoint8cp2,point9: onepoint9,point9cp1: onepoint9cp1,point9cp2: onepoint9cp2,point10: onepoint10,point10cp1: onepoint10cp1,point10cp2: onepoint10cp2)
        
        return oneChangedBGMask.CGPath
        
    }
    
    //######## Drawing MARK: BezierDrawing for TwoChanged BG Wave Mask ########
    func createTwoChangedBGMask() ->CGPathRef{
        
        let np1:CGPoint = CGPointMake(0, 0)
        let np2:CGPoint = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let np3:CGPoint = CGPointMake(493/375 * self.view.frame.size.width, 617/667 * self.view.frame.size.height)
        let np3cp1:CGPoint = CGPointMake(375/375 * self.view.frame.size.width, 0)
        let np3cp2:CGPoint = CGPointMake(493/375 * self.view.frame.size.width, 468/667 * self.view.frame.size.height)
        let np4:CGPoint = CGPointMake(410/375 * self.view.frame.size.width, 652/667 * self.view.frame.size.height)
        let np4cp1:CGPoint = CGPointMake(448/375 * self.view.frame.size.width, 632/667 * self.view.frame.size.height)
        let np4cp2:CGPoint = CGPointMake(425/375 * self.view.frame.size.width, 643/667 * self.view.frame.size.height)
        let np5:CGPoint = CGPointMake(302/375 * self.view.frame.size.width, 679/667 * self.view.frame.size.height)
        let np5cp1:CGPoint = CGPointMake(389/375 * self.view.frame.size.width, 668/667 * self.view.frame.size.height)
        let np5cp2:CGPoint = CGPointMake(332/375 * self.view.frame.size.width, 682/667 * self.view.frame.size.height)
        let np6:CGPoint = CGPointMake(206/375 * self.view.frame.size.width, 672/667 * self.view.frame.size.height)
        let np6cp1:CGPoint = CGPointMake(269.65/375 * self.view.frame.size.width, 675.76/667 * self.view.frame.size.height)
        let np6cp2:CGPoint = CGPointMake(260.5/375 * self.view.frame.size.width, 662/667 * self.view.frame.size.height)
        let np7:CGPoint = CGPointMake(76/375 * self.view.frame.size.width, 668/667 * self.view.frame.size.height)
        let np7cp1:CGPoint = CGPointMake(182/375 * self.view.frame.size.width, 679.82/667 * self.view.frame.size.height)
        let np7cp2:CGPoint = CGPointMake(106.5/375 * self.view.frame.size.width, 683.5/667 * self.view.frame.size.height)
        let np8:CGPoint = CGPointMake(-72/375 * self.view.frame.size.width, 672/667 * self.view.frame.size.height)
        let np8cp1:CGPoint = CGPointMake(43.61/375 * self.view.frame.size.width, 651.54/667 * self.view.frame.size.height)
        let np8cp2:CGPoint = CGPointMake(-19/375 * self.view.frame.size.width, 671.5/667 * self.view.frame.size.height)
        let np9:CGPoint = CGPointMake(-144/375 * self.view.frame.size.width, 626/667 * self.view.frame.size.height)
        let np9cp1:CGPoint = CGPointMake(-106.52/375 * self.view.frame.size.width, 672.33/667 * self.view.frame.size.height)
        let np9cp2:CGPoint = CGPointMake(-135/375 * self.view.frame.size.width, 641/667 * self.view.frame.size.height)
        let np10:CGPoint = CGPointMake(0, 0)
        let np10cp1:CGPoint = CGPointMake(-144/375 * self.view.frame.size.width, 495.5/667 * self.view.frame.size.height)
        let np10cp2:CGPoint = CGPointMake(0,0)
        
        let twoChangedBGMask:UIBezierPath = self.createMaskPath(np1,point2: np2,point3: np3,point3cp1: np3cp1,point3cp2: np3cp2,point4: np4,point4cp1: np4cp1,point4cp2: np4cp2,point5: np5,point5cp1: np5cp1,point5cp2: np5cp2,point6: np6,point6cp1: np6cp1,point6cp2: np6cp2,point7: np7,point7cp1: np7cp1,point7cp2: np7cp2,point8: np8,point8cp1: np8cp1,point8cp2: np8cp2,point9: np9,point9cp1: np9cp1,point9cp2: np9cp2,point10: np10,point10cp1: np10cp1,point10cp2: np10cp2)
        
        return twoChangedBGMask.CGPath
        
    }
    
    

    
    

    

}

