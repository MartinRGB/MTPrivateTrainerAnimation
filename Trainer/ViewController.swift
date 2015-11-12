//
//  ViewController.swift
//  Trainer
//
//  Created by KingMartin on 15/11/11.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    var maskPath:UIBezierPath! = UIBezierPath()
    var maskPathforCard:UIBezierPath! = UIBezierPath()
    var rectanglePath:UIBezierPath! = UIBezierPath()
    var rectangleBlurPath:UIBezierPath! = UIBezierPath()
    
    
    let waveMaskView:UIView! = UIView()
    let waveMaskViewforCard:UIView! = UIView()
    let cardContainer:UIView! = UIView()
    let containerViewForFAB:UIView! = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        
        setup()
        animationSetup()
        drawFABinView()
        animationFABSetup()
        
    }

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
        
        //container
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
        
        // MARK: BezierDrawing for masklayer
        maskPath.moveToPoint(CGPointMake(0, -0))
        maskPath.addLineToPoint(CGPointMake(376, 0))
        maskPath.addCurveToPoint(CGPointMake(376, 614), controlPoint1: CGPointMake(376, 0), controlPoint2: CGPointMake(376, 496))
        maskPath.addCurveToPoint(CGPointMake(293.77, 635.18), controlPoint1: CGPointMake(344.22, 629.89), controlPoint2: CGPointMake(317.68, 635.59))
        maskPath.addCurveToPoint(CGPointMake(238.96, 624.13), controlPoint1: CGPointMake(274.23, 634.84), controlPoint2: CGPointMake(256.44, 630.41))
        maskPath.addCurveToPoint(CGPointMake(187.95, 602.77), controlPoint1: CGPointMake(222.1, 618.07), controlPoint2: CGPointMake(205.53, 610.29))
        maskPath.addCurveToPoint(CGPointMake(136.66, 584.43), controlPoint1: CGPointMake(172, 595.94), controlPoint2: CGPointMake(155.23, 589.33))
        maskPath.addCurveToPoint(CGPointMake(84.96, 576.58), controlPoint1: CGPointMake(120.91, 580.28), controlPoint2: CGPointMake(103.87, 577.36))
        maskPath.addCurveToPoint(CGPointMake(0, 586.5), controlPoint1: CGPointMake(60.27, 575.56), controlPoint2: CGPointMake(32.39, 578.19))
        maskPath.addCurveToPoint(CGPointMake(0, -0), controlPoint1: CGPointMake(0, 449), controlPoint2: CGPointMake(0, -0))
        maskPath.closePath()
        UIColor.grayColor().setFill()
        maskPath.fill()
        
        maskPathforCard.moveToPoint(CGPointMake(0, -0))
        maskPathforCard.addLineToPoint(CGPointMake(376, 0))
        maskPathforCard.addCurveToPoint(CGPointMake(376, 614), controlPoint1: CGPointMake(376, 0), controlPoint2: CGPointMake(376, 496))
        maskPathforCard.addCurveToPoint(CGPointMake(293.77, 635.18), controlPoint1: CGPointMake(344.22, 629.89), controlPoint2: CGPointMake(317.68, 635.59))
        maskPathforCard.addCurveToPoint(CGPointMake(238.96, 624.13), controlPoint1: CGPointMake(274.23, 634.84), controlPoint2: CGPointMake(256.44, 630.41))
        maskPathforCard.addCurveToPoint(CGPointMake(187.95, 602.77), controlPoint1: CGPointMake(222.1, 618.07), controlPoint2: CGPointMake(205.53, 610.29))
        maskPathforCard.addCurveToPoint(CGPointMake(136.66, 584.43), controlPoint1: CGPointMake(172, 595.94), controlPoint2: CGPointMake(155.23, 589.33))
        maskPathforCard.addCurveToPoint(CGPointMake(84.96, 576.58), controlPoint1: CGPointMake(120.91, 580.28), controlPoint2: CGPointMake(103.87, 577.36))
        maskPathforCard.addCurveToPoint(CGPointMake(0, 586.5), controlPoint1: CGPointMake(60.27, 575.56), controlPoint2: CGPointMake(32.39, 578.19))
        maskPathforCard.addCurveToPoint(CGPointMake(0, -0), controlPoint1: CGPointMake(0, 449), controlPoint2: CGPointMake(0, -0))
        maskPathforCard.closePath()
        UIColor.grayColor().setFill()
        maskPathforCard.fill()
        // MARK:Add bezierpath to CAShaplyer then to UIView(as maskView)
        self.wave.path = maskPath.CGPath
        wave.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).CGColor
        wave.frame = CGRectMake(0,0,self.view.frame.size.width,0.954 * self.view.frame.height)
        
        self.waveforCard.path = maskPathforCard.CGPath
        waveforCard.fillColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1).CGColor
        waveforCard.frame = CGRectMake(0,0,self.view.frame.size.width,0.954 * self.view.frame.height)
        
        waveMaskView.frame = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        waveMaskView.layer.addSublayer(wave)
        //self.view.addSubview(waveMaskView)
        
        waveMaskViewforCard.frame = CGRectMake(0,-0.954 * self.view.frame.height,self.view.frame.width,0.954 * self.view.frame.height)
        waveMaskViewforCard.layer.addSublayer(waveforCard)
        //self.view.addSubview(waveMaskViewforCard)
        
        bgUp.maskView = waveMaskView
        cardContainer.maskView = waveMaskViewforCard
        
        // MARK: Text
        
        card0.frame = CGRectMake(1.096 * self.view.frame.size.width , 0.048 * self.view.frame.size.height, 0.808 * self.view.frame.size.width, 0.068 * self.view.frame.size.height)
        card0.image = UIImage(named: "card0")
        self.view.insertSubview(card0, aboveSubview: bgUp)
        
        
    }
    
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
        
        card3.layer.addAnimation(card3CommonAnims, forKey: "card3Positions")
        
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
        
        
        //Need Container
        //bgUp.frame.origin.y = 0 - (waveMaskView.bounds.origin.y + self.view.frame.width * 0.954)/25
        //temp = thisComp.layer("BG Moving Cursor").transform.yPosition+639;
        //[375, 667 - temp/25]
        
    }
    
    func drawFABinView(){
        
        
        let context = UIGraphicsGetCurrentContext()
        
        //container
        
        containerViewForFAB.frame = CGRectMake(0, 0.222 * self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)
        self.view.addSubview(containerViewForFAB)
        
        
        
        //Path
        rectanglePath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084, self.view.frame.size.height * 0.883, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        CGContextSaveGState(context)
        rectanglePath.fill()
        
        rectangleBlurPath = UIBezierPath(roundedRect: CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.084+3, self.view.frame.size.height * 0.883+4, self.view.frame.size.width * 0.168, self.view.frame.size.width * 0.168), cornerRadius: self.view.frame.size.width * 0.084)
        CGContextSaveGState(context)
        rectangleBlurPath.fill()
        
        
        //ShapeLayer
        self.rectangleFABLayer.path = rectanglePath.CGPath
        rectangleFABLayer.fillColor = UIColor(red: 0.482, green: 0.741, blue: 0.894, alpha: 1.000).CGColor
        rectangleFABLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        
        rectangleBlurFABLayer.path = rectangleBlurPath.CGPath
        rectangleBlurFABLayer.fillColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.07).CGColor
        rectangleBlurFABLayer.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        
        
        containerViewForFAB.layer.addSublayer(rectangleBlurFABLayer)
        containerViewForFAB.layer.addSublayer(rectangleFABLayer)
        
        arrow.image = UIImage(named: "Arrow")
        arrow.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.0425, self.view.frame.size.height * 0.918, self.view.frame.size.width * 0.085, self.view.frame.size.width * 0.045)
        
        containerViewForFAB.addSubview(arrow)
        
        explore.image = UIImage(named: "Explore")
        explore.frame = CGRectMake(self.view.frame.size.width/2 - self.view.frame.size.width * 0.3595, self.view.frame.size.height * 0.921, self.view.frame.size.width * 0.211, self.view.frame.size.width * 0.067)
        explore.transform = CGAffineTransformMakeScale(0.8, 0.8)
        
        containerViewForFAB.addSubview(explore)
        
        containerViewForFAB.alpha = 0.8
        
        CGContextRestoreGState(context)
        
        
    }
    
    func animationFABSetup() {
        
        let initTime = CACurrentMediaTime() + 0.45 + 1/6
        
        //ball
        
        
        
        let containerViewForFABY = CABasicAnimation(keyPath: "bounds")
        let currentYPositonCard = CGRectMake(0, 0.238 * self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height)
        let afterYPositionCard = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        containerViewForFABY.beginTime = initTime
        containerViewForFABY.duration = 1 + 14/30
        containerViewForFABY.fromValue = NSValue(CGRect:afterYPositionCard)
        containerViewForFABY.toValue = NSValue(CGRect:currentYPositonCard)
        containerViewForFABY.removedOnCompletion = false
        containerViewForFABY.autoreverses = false
        containerViewForFABY.fillMode = kCAFillModeForwards
        containerViewForFABY.timingFunction = CAMediaTimingFunction(controlPoints: 0.09147787840335, 1.71311978494373, 0.17607621676994, 0.83763306077712)
        
        containerViewForFAB.layer.addAnimation(containerViewForFABY, forKey: "maskViewY")
        
        
        //btn
        
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
        
        //arrow
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
        
        
        //text
        
        
        
        
        
        
        let textpositon = CABasicAnimation(keyPath: "position")
        textpositon.beginTime = initTime + 5/6
        textpositon.duration = 2/3
        textpositon.toValue = NSValue(CGPoint:CGPointMake(self.view.frame.size.width/2, self.view.frame.height * 0.942))
        textpositon.removedOnCompletion = false
        textpositon.autoreverses = false
        textpositon.fillMode = kCAFillModeForwards
        textpositon.timingFunction = CAMediaTimingFunction(controlPoints: 0.16, 0, 0.1, 1)
        
        explore.layer.addAnimation(textpositon, forKey: "maskViewY")
        
        
        
       
    }
    

    
    

    

}

