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
    @IBOutlet weak var duringClassLabel: UILabel!
    @IBOutlet weak var classLabel: UILabel!
    @IBOutlet weak var finishedLabel: UILabel!
    @IBOutlet weak var totalClassLabel: UILabel!
    @IBOutlet weak var totalStudentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
