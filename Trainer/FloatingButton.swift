//
//  FloatingButton.swift
//  Trainer
//
//  Created by KingMartin on 15/12/15.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit

class FloatingButton: UIButton {

   
    convenience init(image:UIImage?, backgroundColor:UIColor = UIColor.fabBlueColor){
        self.init()
        setImage(image, forState: .Normal)
        setBackgroundImage(backgroundColor.pixelImage, forState: .Normal)
    }
    
    init(){
        super.init(frame:CGRect(x: 0,y: 0,width: UIScreen.mainScreen().bounds.width * 0.16,height: UIScreen.mainScreen().bounds.width * 0.16))
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        tintColor = UIColor.whiteColor()
        
        if backgroundImageForState(.Normal) == nil {
            setBackgroundImage(UIColor.flatBlueColor.pixelImage, forState: .Normal)
        }
        
        
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
    }

}
