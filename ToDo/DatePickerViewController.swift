//
//  DatePickerViewController.swift
//  ToDo
//
//  Created by Valery Girkin on 29.12.14.
//  Copyright (c) 2014 Valery Girkin. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate {
    
    func changeDate(date: NSDate)
}

class DatePickerViewController: UIViewController {

    var delegate: DatePickerViewControllerDelegate?

    @IBAction func changeWithSelectedDate(sender: AnyObject) {
        var datePicker = sender as UIDatePicker
        delegate!.changeDate(datePicker.date)
    }
}
