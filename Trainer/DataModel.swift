//
//  DataModel.swift
//  Trainer
//
//  Created by KingMartin on 15/12/14.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit

struct FeedInfo {
    
    let primaryColor:UIColor
    let alphaColor:UIColor
    let coachAvatar:UIImage
    let courseName:String!
    let coachName:String!
    let duringClass:Int!
    let totalClass:Int!
    let process:CGFloat
    let totalStudent:Int!
    
}

let feedData = [
    
    FeedInfo(primaryColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 1), alphaColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 1), alphaColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 1),alphaColor:UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 1), alphaColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 1), alphaColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 1),alphaColor:UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 1), alphaColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 1), alphaColor: UIColor(red: 229/255.0, green: 194/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    
    FeedInfo(primaryColor: UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 1),alphaColor:UIColor(red: 229/255.0, green: 125/255.0, blue: 125/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 1), alphaColor: UIColor(red: 125/255.0, green: 190/255.0, blue: 229/255.0, alpha: 0.45), coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264)
]