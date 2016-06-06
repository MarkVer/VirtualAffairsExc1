//
//  ViewController.swift
//  VA_exc1
//
//  Created by Mark Verwoerd on 02/06/16.
//  Copyright © 2016 Mark Verwoerd. All rights reserved.
//

import UIKit

class dateController: UIViewController {

    @IBOutlet var DatePicker: UIDatePicker!
    @IBOutlet var beginDate: UILabel!
    @IBOutlet var endDate: UILabel!
    
    
    @IBAction func clear(sender: AnyObject){
        DatePicker.date = NSDate()
        datePicker(DatePicker)
    }
   
    // Variable days to add
    var daysToAdd = 7
    
    
    // Convert the date to a String
    func datePicker (datePicker: UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.locale = NSLocale.currentLocale()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        let dateValue = dateFormatter.stringFromDate(datePicker.date)
       
        // Add days to datePicker.date
        let calculatedDate = NSCalendar.currentCalendar().dateByAddingUnit(NSCalendarUnit.Day, value: daysToAdd, toDate: datePicker.date, options: NSCalendarOptions.init(rawValue: 0))
         let dateValueEnd = dateFormatter.stringFromDate(calculatedDate!)
        // Show values at labels
        beginDate.text = dateValue
        endDate.text = dateValueEnd
        
    }
    
    
    override func viewDidLoad() {
        
      // minimum date must be current date
        DatePicker.minimumDate=NSDate()
        
      // display date from datepicker
        DatePicker.addTarget(self, action: #selector(dateController.datePicker),forControlEvents:UIControlEvents.ValueChanged)
        
      // when the view is loaded, load the current date into the label
       DatePicker.date = NSDate()
       datePicker(DatePicker)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

