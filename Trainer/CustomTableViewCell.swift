//
//  CustomTableViewCell.swift
//  Trainer
//
//  Created by KingMartin on 15/12/13.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit



class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var courseNameLabel: UILabel!
    @IBOutlet weak var teacherNameLabel: UILabel!
    @IBOutlet weak var processingBarView: UIView!
    @IBOutlet weak var totalProcessingBarView: UIView!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var totalClassLabel: UILabel!
    @IBOutlet weak var classDataView: UIView!
    @IBOutlet weak var totalStudentView: UIView!
    
    var feed:FeedInfo!
    var cellDuringColor:UIColor!
    
    var tensSliderContainer:SliderLabelContainer!
    var singleSliderContainer:SliderLabelContainer!
    
    var hundredStudentConatiner = SliderLabelContainer(frame: CGRectMake(-3, 21, 26, 30), type: SliderLabelContainerType.HundredDigitType,fontsize:36,color:UIColor(red: 78/255.0, green: 107/255.0, blue: 128/255.0, alpha: 1))
    var tenStudentConatiner = SliderLabelContainer(frame: CGRectMake(15, 21, 26, 30), type: SliderLabelContainerType.TensDigitType,fontsize:36,color:UIColor(red: 78/255.0, green: 107/255.0, blue: 128/255.0, alpha: 1))
    var singleStudentConatiner = SliderLabelContainer(frame: CGRectMake(34, 21, 26, 30), type: SliderLabelContainerType.SingleDigitType,fontsize:36,color:UIColor(red: 78/255.0, green: 107/255.0, blue: 128/255.0, alpha: 1))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        totalStudentView.addSubview(hundredStudentConatiner)
        totalStudentView.addSubview(tenStudentConatiner)
        totalStudentView.addSubview(singleStudentConatiner)

        // Initialization code
    }
    
    override func layoutSubviews() {
        
        if((tensSliderContainer) != nil){
            tensSliderContainer.removeFromSuperview()
        }
        if((singleSliderContainer) != nil){
            singleSliderContainer.removeFromSuperview()
        }
        
        courseNameLabel?.text = feed.courseName
        teacherNameLabel?.text = feed.coachName
        avatarImageView?.image = feed.coachAvatar
        
        let color:UIColor = feed.primaryColor
        classLabel?.textColor = color
        finishedLabel?.textColor = color
        processingBarView.backgroundColor = color
        totalProcessingBarView.backgroundColor = feed.alphaColor
        totalClassLabel?.text = "of \(feed.totalClass)"
        
        //Imp:Progress Bar & Number
        
        totalProcessingBarView.clipsToBounds = true
        cellDuringColor = color
        
        tensSliderContainer = SliderLabelContainer(frame: CGRectMake(6, 22, 35, 45), type: SliderLabelContainerType.TensDigitType,fontsize:54,color:cellDuringColor)
        singleSliderContainer = SliderLabelContainer(frame: CGRectMake(34, 22, 36, 45), type: SliderLabelContainerType.SingleDigitType,fontsize:54,color:cellDuringColor)
        
        classDataView.addSubview(tensSliderContainer)
        classDataView.addSubview(singleSliderContainer)
        
        UIView.animateWithDuration(1, delay: 0.2, options: UIViewAnimationOptions.CurveEaseOut, animations: { () -> Void in
            
            self.processingBarView.transform = CGAffineTransformMakeTranslation(self.totalProcessingBarView.frame.size.width * self.feed.process, 0)
            
            let num = self.feed.duringClass
            self.startLoadNumber(num)
            
            let num2 = self.feed.totalStudent
            self.startLoadStudentNumber(num2)
            },completion: nil)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //######## Function MARK:Status Bar Hidden Method ########
    func startLoadNumber(num:Int){
        let tensDigit:Int = num/10
        let singleDigit:Int = num%10
        
        tensSliderContainer.scrollToNum(tensDigit)
        singleSliderContainer.scrollToNum(singleDigit)
        
    }
    
    func startLoadStudentNumber(num:Int){
        let hundredDigit:Int = num/100
        let tensDigit:Int = (num - Int(num/100) * 100)/10
        let singleDigit:Int = num%10
        
        hundredStudentConatiner.scrollToNum(hundredDigit)
        tenStudentConatiner.scrollToNum(tensDigit)
        singleStudentConatiner.scrollToNum(singleDigit)
        
        
    }

}
