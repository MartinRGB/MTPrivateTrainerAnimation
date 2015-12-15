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
    
    FeedInfo(primaryColor: UIColor.flatBlueColor, alphaColor: UIColor.flatBlueAlphaColor, coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor.flatYellowColor, alphaColor: UIColor.flatYellowAlphaColor, coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    FeedInfo(primaryColor: UIColor.flatRedColor,alphaColor:UIColor.flatRedAlphaColor, coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor.flatBlueColor, alphaColor: UIColor.flatBlueAlphaColor, coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor.flatYellowColor, alphaColor: UIColor.flatYellowAlphaColor, coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    FeedInfo(primaryColor: UIColor.flatRedColor,alphaColor:UIColor.flatRedAlphaColor, coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor.flatBlueColor, alphaColor: UIColor.flatBlueAlphaColor, coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264),
    
    FeedInfo(primaryColor: UIColor.flatYellowColor, alphaColor: UIColor.flatYellowAlphaColor, coachAvatar: UIImage(named:"Avatar2")!, courseName: "iOS Newbie Camp", coachName: "Luis Rodriguez", duringClass: 16, totalClass: 32, process: 16/32, totalStudent: 342),
    
    FeedInfo(primaryColor: UIColor.flatRedColor,alphaColor:UIColor.flatRedAlphaColor, coachAvatar: UIImage(named:"Avatar3")!, courseName: "The Color Master", coachName: "Taylor Rodriguez", duringClass: 32, totalClass: 42, process: 32/42, totalStudent: 768),
    
    FeedInfo(primaryColor: UIColor.flatBlueColor, alphaColor: UIColor.flatBlueAlphaColor, coachAvatar: UIImage(named:"Avatar1")!, courseName: "Elite Diving Course", coachName: "Daryl Fox", duringClass: 21, totalClass: 35, process: 21/35, totalStudent: 264)
    
]