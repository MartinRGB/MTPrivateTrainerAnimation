//
//  UIColors+FloatingMenu.swift
//  Trainer
//
//  Created by KingMartin on 15/12/15.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit

extension UIColor{
    class var flatBlueColor:UIColor{
        return UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 1)
    }
    class var flatYellowColor:UIColor {
        return UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 1)
    }
    class var flatRedColor:UIColor{
        return UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 1)
    }
    class var flatBlueAlphaColor:UIColor{
        return UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 0.45)
    }
    class var flatYellowAlphaColor:UIColor {
        return UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 0.45)
    }
    class var flatRedAlphaColor:UIColor{
        return UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 0.45)
    }
    class var deepBlueColor:UIColor {
        return UIColor(red: 78/255.0, green: 107/255.0, blue: 128/255.0, alpha: 1)
    }
    class var fabBlueColor:UIColor {
        return UIColor(red: 0.482, green: 0.741, blue: 0.894, alpha: 1.000)
    }
    class var fabShadowColor:UIColor{
        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.07)
    }
    
    var pixelImage: UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, true, 0)
        
        self.setFill()
        UIRectFill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    
    
}
