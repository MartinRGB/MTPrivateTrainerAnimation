//
//  TableViewController.swift
//  Trainer
//
//  Created by KingMartin on 15/11/19.
//  Copyright © 2015年 KingMartin. All rights reserved.
//

import UIKit




class TableViewController: UITableViewController {

    @IBOutlet weak var menuIcon: UIBarButtonItem!
    @IBOutlet weak var glassIcon: UIBarButtonItem!
    
    var isHidden:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Mark:Show the Nav Bar
        self.navigationController?.setNavigationBarHidden(false, animated: false)

        //Mark:Nav Background Img
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "TopBar"), forBarMetrics: .Default)
        
        //Mark:Nav Frame & Label Init
        //navigationController?.navigationBar.frame = CGRectMake(0,0,self.view.frame.width,self.view.frame.height*0.096)
        
        //??
        //self.menuIcon.imageInsets = UIEdgeInsets(top: self.view.frame.size.width/60, left: self.view.frame.size.width/60, bottom: self.view.frame.size.width/60, right: -self.view.frame.size.width/60)
        //self.glassIcon.imageInsets = UIEdgeInsets(top: self.view.frame.size.width/60, left: self.view.frame.size.width/20, bottom: self.view.frame.size.width/60, right: -self.view.frame.size.width/10)
        
        //Mark:Simple make some constraint for layout
        //courseTableView.frame = CGRectMake(0, self.view.bounds.height * 0.096, self.view.bounds.width, self.view.bounds.height * 0.904)
        
        self.navigationController?.navigationBar.alpha = 1
        
        if tableView.rowHeight > 150{
            
            tableView.rowHeight = self.view.bounds.height * 0.265
        }
        else{
            tableView.rowHeight = 150
        }
        
        tableView.showsVerticalScrollIndicator = false
        

    }
    
    // Mark: - Custom the animation when cell comes in
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        //1. Init the Cell's Position
        
        //Very Important Step
        self.tableView.reloadData()
        
        let tableHeight:CGFloat = self.tableView.bounds.size.height
        let visibleCells:NSArray = tableView.visibleCells
        
        for var beforeCell = 0;beforeCell < visibleCells.count;beforeCell++ {
            let visibleCell:CustomTableViewCell = visibleCells.objectAtIndex(beforeCell) as! CustomTableViewCell
            if(visibleCell.isKindOfClass(CustomTableViewCell)){
            visibleCell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
            }
        }
        
        //Now Animation(Chained Delay)
        
        var index = 0
        
        for movingVisibleCells in visibleCells{
            let visibleCell: CustomTableViewCell = movingVisibleCells as! CustomTableViewCell
            UIView.animateWithDuration(1.5, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                
                visibleCell.transform = CGAffineTransformMakeTranslation(0, 0);
                
                }, completion: nil)
            
            index += 1
        }
        
    }
    
    // MARK: - Table view data source

    @IBAction func back(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(false)
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedData.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell

        initCoachCell(cell,indexPath: indexPath)
        
        
        
      
        
        
        
        
        
        
        
        return cell
    }
    
    
    

    //######## Function MARK:Cell Init Method ########
    func initCoachCell(cell:CustomTableViewCell,indexPath:NSIndexPath){
        
        cell.courseNameLabel?.text = feedData[indexPath.row].courseName
        cell.teacherNameLabel?.text = feedData[indexPath.row].coachName
        cell.avatarImageView?.image = feedData[indexPath.row].coachAvatar
       
        cell.classLabel?.textColor = feedData[indexPath.row].primaryColor
        cell.finishedLabel?.textColor = feedData[indexPath.row].primaryColor
        cell.processingBarView.backgroundColor = feedData[indexPath.row].primaryColor
        cell.totalProcessingBarView.backgroundColor = feedData[indexPath.row].alphaColor
        cell.totalClassLabel?.text = "of \(feedData[indexPath.row].totalClass)"
        
        //Imp:Progress Bar & Number
        
        cell.totalProcessingBarView.clipsToBounds = true
        cell.cellDuringColor = feedData[indexPath.row].primaryColor
        cell.feed = feedData[indexPath.row]
        
        //是否重复刷
//        let initNum:Int = 0
//        let initNum2:Int = 0
//        cell.processingBarView.transform = CGAffineTransformMakeTranslation(0, 0)
//        cell.startLoadNumber(initNum)
//        cell.startLoadStudentNumber(initNum2)
        
        
    }
    
    
    
    //######## Function MARK:Status Bar Hidden Method ########
    override func prefersStatusBarHidden() -> Bool {
        return false
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

}
