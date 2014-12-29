//
//  RootViewController.swift
//  ToDo
//
//  Created by Valery Girkin on 23.12.14.
//  Copyright (c) 2014 Valery Girkin. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    var colors: [String: UIColor] = ["Blue": UIColor(red: 87.0/255, green: 228.0/255, blue: 255.0/255, alpha: 1.0), "Green": UIColor(red: 60.0/255, green: 232.0/255, blue: 116.0/255, alpha: 1.0), "Yellow": UIColor(red: 240.0/255, green: 250.0/255, blue: 70.0/255, alpha: 1.0), "Orange": UIColor(red: 243.0/255, green: 150.0/255, blue: 52.0/255, alpha: 1.0), "Red": UIColor(red: 250.0/255, green: 102.0/255, blue: 70.0/255, alpha: 1.0), "Purple": UIColor(red: 166.0/255, green: 90.0/255, blue: 242.0/255, alpha: 1.0)]
    
    @IBOutlet weak var eventTable: UITableView!

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        eventTable.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let eventViewController = segue.destinationViewController as EventViewController
        eventViewController.delegate = self
        if (segue.identifier == "passEvent") {
            var events = Event.MR_findAll() as [Event]
            eventViewController.event = events[self.eventTable.indexPathForSelectedRow()!.row]
        } else if (segue.identifier == "addEvent") {
            eventViewController.event = nil
        }
    }
}

extension RootViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var events = Event.MR_findAll() as [Event]
        return events.count
        }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var events = Event.MR_findAll() as [Event]
        let cell = eventTable.dequeueReusableCellWithIdentifier("eventTableCell", forIndexPath: indexPath) as TableViewCell
        let tmp = events[indexPath.row]
        cell.title.text = "\(tmp.title) at \(tmp.date)"
        cell.colorView.backgroundColor = colors[tmp.color]
        return cell
    }
}
