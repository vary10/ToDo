//
//  ViewController.swift
//  ToDo
//
//  Created by Valery Girkin on 23.12.14.
//  Copyright (c) 2014 Valery Girkin. All rights reserved.
//

import UIKit
import CoreData


class EventViewController: UITableViewController, UIPopoverPresentationControllerDelegate, UITextFieldDelegate, UITextViewDelegate {
    
    var colors: [String: UIColor] = ["Blue": UIColor(red: 87.0/255, green: 228.0/255, blue: 255.0/255, alpha: 1.0), "Green": UIColor(red: 60.0/255, green: 232.0/255, blue: 116.0/255, alpha: 1.0), "Yellow": UIColor(red: 240.0/255, green: 250.0/255, blue: 70.0/255, alpha: 1.0), "Orange": UIColor(red: 243.0/255, green: 150.0/255, blue: 52.0/255, alpha: 1.0), "Red": UIColor(red: 250.0/255, green: 102.0/255, blue: 70.0/255, alpha: 1.0), "Purple": UIColor(red: 166.0/255, green: 90.0/255, blue: 242.0/255, alpha: 1.0)]

    var delegate: RootViewController?
    var color: String = "Red"
    var date = ""
    var event: Event?

    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priorityMetr: UISegmentedControl!
    
    @IBAction func colorPickerButton(sender: UIButton) {
        let popoverVC = storyboard?.instantiateViewControllerWithIdentifier("colorPickerPopover") as ColorPickerViewController
        popoverVC.modalPresentationStyle = .Popover
        popoverVC.preferredContentSize = CGSizeMake(200, 120)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 85, height: 30)
            popoverController.permittedArrowDirections = .Any
            popoverController.delegate = self
            popoverVC.delegate = self
        }
        presentViewController(popoverVC, animated: true, completion: nil)
    }
    
    @IBAction func datePickerButton(sender: UIButton) {
        let popoverVC = storyboard?.instantiateViewControllerWithIdentifier("datePickerPopover") as DatePickerViewController
        popoverVC.modalPresentationStyle = .Popover
        popoverVC.preferredContentSize = CGSizeMake(320, 162)
        if let popoverController = popoverVC.popoverPresentationController {
            popoverController.sourceView = sender
            popoverController.sourceRect = CGRect(x: 0, y: 0, width: 320, height: 162)
            popoverController.permittedArrowDirections = .Any
            popoverController.delegate = self
            popoverVC.delegate = self
        }
        presentViewController(popoverVC, animated: true, completion: nil)
    }

    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController!) -> UIModalPresentationStyle {
        return .None
    }


    override func viewWillAppear(animated: Bool) {
        titleTextField.delegate = self
        descriptionTextField.delegate = self
        if let initEvent = event {
            colorButton.backgroundColor = colors[initEvent.color]
            titleTextField.text = initEvent.title
            descriptionTextField.text = initEvent.descrition
            priorityMetr.selectedSegmentIndex = initEvent.priority.integerValue
            dateButton.setTitle(initEvent.date, forState: UIControlState.Normal)
        } else {
            titleTextField.text = ""
            descriptionTextField.text = ""
            dateButton.setTitle("Choose", forState: UIControlState.Normal)
        }
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    
    

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if let initEvent = event {
            initEvent.title = self.titleTextField.text
            initEvent.descrition = self.descriptionTextField.text
            initEvent.date = self.date
            initEvent.priority = self.priorityMetr.selectedSegmentIndex
            initEvent.color = self.color
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        } else {
            let event = Event.MR_createEntity() as Event
            event.title = self.titleTextField.text
            event.descrition = self.descriptionTextField.text
            event.date = self.date
            event.priority = self.priorityMetr.selectedSegmentIndex
            event.color = self.color
            NSManagedObjectContext.MR_defaultContext().MR_saveToPersistentStoreAndWait()
        }
    }
}

extension EventViewController: ColorPickerViewControllerDelegate {

    func changeColor(colorName: String) {
        self.colorButton.backgroundColor = colors[colorName]
        self.color = colorName
    }
}

extension EventViewController: DatePickerViewControllerDelegate {
    
    func changeDate(date: NSDate) {
        var formatter = NSDateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEE, MMM d, ''yy")
        self.date = formatter.stringFromDate(date)
        dateButton.setTitle(self.date, forState: UIControlState.Normal)
    }
}
