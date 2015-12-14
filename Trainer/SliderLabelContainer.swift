//
//  SliderLabelContainer.swift
//  Trainer
//
//  Created by KingMartin on 15/12/14.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit



//枚举Slider三种形式 个、十、百
enum SliderLabelContainerType{
    case SingleDigitType
    case TensDigitType
    case HundredDigitType
}

class SliderLabelContainer: UIView {

    var singleDigitScroll:UIScrollView!
    
    private var scrollType:SliderLabelContainerType = SliderLabelContainerType.SingleDigitType
    
    //Slider ScrollView的初始化
    init(frame: CGRect,type:SliderLabelContainerType,fontsize:Int,color:UIColor) {
        super.init(frame:frame)
        scrollType = type
        
        
        singleDigitScroll = UIScrollView(frame: self.bounds)
        singleDigitScroll.userInteractionEnabled = false
        singleDigitScroll.showsVerticalScrollIndicator = false
        singleDigitScroll.contentSize = CGSizeMake(CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds)*10)
        
        //利用遍历排列scrollView
        for i in 0...10{
            let label:UILabel = UILabel(frame: CGRectMake(0,CGRectGetHeight(self.bounds)*CGFloat(i),CGRectGetWidth(self.bounds),CGRectGetHeight(self.bounds)))
            label.text = "\(i)"
            label.textAlignment = NSTextAlignment.Center
            label.font = UIFont(name: "Avenir-Light", size: CGFloat(fontsize))
            label.textColor = color
            singleDigitScroll.addSubview(label)
        }
        self.addSubview(singleDigitScroll)
    
    }
    
    //Animation Part
    func scrollToNum(num:Int){
        if scrollType == .SingleDigitType{
            self.singleDigitScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
            
//            UIView.animateWithDuration(0.85, animations: { () -> Void in
//               
//            })
            
            
        }
        else if scrollType == .TensDigitType{
            self.singleDigitScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
           
//            UIView.animateWithDuration(1, animations: { () -> Void in
//                
//            })
        }
        else if scrollType == .HundredDigitType{
            self.singleDigitScroll.contentOffset = CGPointMake(0, CGRectGetHeight(self.bounds) * CGFloat(num))
            
//            UIView.animateWithDuration(1.15, animations: { () -> Void in
//                
//            })
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
