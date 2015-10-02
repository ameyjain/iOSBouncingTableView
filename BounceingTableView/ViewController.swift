//
//  BouncingTableViewController.swift
//  new instagram
//
//  Created by Amey Jain on 6/18/15.
//  Copyright (c) 2015 Amey Jain. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {
    
    var TableArray = [String]()
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableArray = ["Frist item","Second item","Third item","Fourth item","Fifth item","Sixth item"]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        animateTable()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
                
    }
    
    
    
    func animateTable() {
        tableView.reloadData()
        
        let cells = tableView.visibleCells
        let tableHeight: CGFloat = tableView.bounds.size.height
        
        for i in cells {
            let cell: UITableViewCell = i 
            cell.transform = CGAffineTransformMakeTranslation(0, tableHeight)
        }
        
        var index = 0
        
        for a in cells {
            let cell: UITableViewCell = a 
            UIView.animateWithDuration(1, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransformMakeTranslation(0, 0);
                }, completion: nil)
            
            index += 1
        }
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return tableView.frame.height/6
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell1 = tableView.dequeueReusableCellWithIdentifier(TableArray[indexPath.row], forIndexPath: indexPath)
        
            cell1.textLabel?.textColor = UIColor.whiteColor()
            cell1.textLabel?.text = self.TableArray[indexPath.row]
        
        if ( indexPath.row % 2 == 0 ){
            cell1.backgroundColor = UIColor .purpleColor()
        }
        else{
            cell1.backgroundColor = UIColor .purpleColor().colorWithAlphaComponent(0.2)
            cell1.textLabel?.backgroundColor = UIColor.whiteColor().colorWithAlphaComponent(0.0)
        }
        return cell1
    }
    
    
    @IBAction func refreshButtonPressed(sender: AnyObject) {
        tableView.reloadData()
        animateTable()

    }
    
    
    
}
