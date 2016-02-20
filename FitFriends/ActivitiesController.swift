//
//  ActivitiesController.swift
//  FitFriends
//
//  Created by Dennis Adjei-Baah on 8/8/15.
//  Copyright (c) 2015 Dennis Adjei-Baah. All rights reserved.
//

import Foundation
import UIKit
import RestKit
import DateTools


class ActivityViewCell:UITableViewCell{
    @IBOutlet var activityName:UILabel?
    @IBOutlet var datePosted:UILabel?
    @IBOutlet var activityLocationName:UILabel?
    @IBOutlet var participants:UILabel?
    
    func initActivity(post:ActivityPost){
        
        activityName?.text = post.activityName
       datePosted?.text = post.dateposted.timeAgoSinceNow()
        activityLocationName?.text = post.activityLocationName
        participants?.text = post.participants.stringValue
        
    }
}

class ActivitiesController: UITableViewController {
    var activities:[ActivityPost] = []
    
    override func viewDidAppear(animated: Bool) {
        loadActivites()
    }
    
    override func viewDidLoad() {
        let nib = UINib(nibName: "ActivityViewCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "ActivityViewCell") 
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell  {
       let cell: ActivityViewCell = tableView.dequeueReusableCellWithIdentifier("ActivityViewCell", forIndexPath: indexPath) as! ActivityViewCell
        let activityPost = self.activities[indexPath.row] as ActivityPost
       cell.initActivity(activityPost)
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the count of the number of rows in the table
        return activities.count
    }
    
    func loadActivites(){
        
        RKObjectManager.sharedManager().getObjectsAtPath(ActivityPost.activityPostPath, parameters: nil, success: {(request , results) -> Void in
        self.activities = results!.array() as! [ActivityPost]
            self.tableView.reloadData()
            }, failure:{ (operation, error) -> Void in
                NSLog("failed")
        })
    }
}
