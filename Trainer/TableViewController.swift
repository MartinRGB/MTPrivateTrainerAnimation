//
//  TableViewController.swift
//  Trainer
//
//  Created by KingMartin on 15/11/19.
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
        
        
//        var totalClassNumber:Double = 0
//        var totalStudentNumber:Double = 0
//        var duringClassNumber:Double = 0
//
//        cell.totalClassLabel?.text = "of \(totalClassNumber)"
//        cell.totalStudentLabel?.text = "\(totalStudentNumber)"
//        cell.duringClassLabel?.text = "\(duringClassNumber)"
//        
//        UIView.animateWithDuration(1.0) { () -> Void in
//            totalClassNumber = Double(feedData[indexPath.row].totalClass)
//            totalStudentNumber = Double(feedData[indexPath.row].totalStudent)
//            duringClassNumber = Double(feedData[indexPath.row].duringClass)
//        }
        
        cell.totalClassLabel?.text = "of \(feedData[indexPath.row].totalClass)"
        cell.totalStudentLabel?.text = "\(feedData[indexPath.row].totalStudent)"
        cell.duringClassLabel?.text = "\(feedData[indexPath.row].duringClass)"
        
        
//        //changed num
//        cell.totalClassLabel?.text = "of \(feedData[indexPath.row].totalClass)"
//        cell.totalStudentLabel?.text = "\(feedData[indexPath.row].totalStudent)"
//        cell.duringClassLabel?.text = "\(feedData[indexPath.row].duringClass)"
//        
        cell.totalProcessingBarView.clipsToBounds = true
        cell.processingBarView.transform = CGAffineTransformMakeTranslation(cell.totalProcessingBarView.frame.size.width * feedData[indexPath.row].process, 0)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func initCoachCell(cell:CustomTableViewCell,indexPath:NSIndexPath){
        
        cell.courseNameLabel?.text = feedData[indexPath.row].courseName
        cell.teacherNameLabel?.text = feedData[indexPath.row].coachName
        cell.avatarImageView?.image = feedData[indexPath.row].coachAvatar
       
        cell.duringClassLabel?.textColor = feedData[indexPath.row].primaryColor
        cell.classLabel?.textColor = feedData[indexPath.row].primaryColor
        cell.finishedLabel?.textColor = feedData[indexPath.row].primaryColor
        cell.processingBarView.backgroundColor = feedData[indexPath.row].primaryColor
        cell.totalProcessingBarView.backgroundColor = feedData[indexPath.row].alphaColor
       
        
        
    }
    
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
