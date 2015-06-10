//
//  ViewHistoryViewController.swift
//  Roshambo
//
//  Created by Nicholas Schirmer on 6/10/15.
//  Copyright (c) 2015 Shiny New Software, LLC. All rights reserved.
//

import UIKit

class ViewHistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var history = [RPSMatch]()
    
    override func viewDidLoad() {
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as! UITableViewCell
   
        let match = history[indexPath.row]
        
        cell.imageView?.image = UIImage(named: match.isTie ? match.tie.imageName : match.winner.imageName)

        cell.textLabel?.text = "\(match.p1) vs. \(match.p2)"
        cell.detailTextLabel?.text = match.outcome
        
        if !match.isTie {
            cell.textLabel?.textColor = match.p1.defeats(match.p2) ? UIColor.greenColor() : UIColor.redColor()
        }
        
        return cell
    }
    
    @IBAction func closeHistory(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}