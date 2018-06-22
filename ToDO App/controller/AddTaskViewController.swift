//
//  AddTaskViewController.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 21.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
import UserNotifications

class AddTaskViewController: UIViewController {
    var dateString : String?
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var date_picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funcDatePicker()
        gradientBgColor()
    
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
     let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskTextField.text!
        task.date = descTextField.text!
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        let _ = navigationController?.popViewController(animated: true)
        
        notify()
        dateConvert()
  }
    
    func notify(){
        let center = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound];
        
        center.requestAuthorization(options: options) { (granted, error) in
            if !granted {
                print("Something went wrong")
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = taskTextField.text!
        content.body = descTextField.text!
        content.sound = UNNotificationSound.default()
        
        let triggerDate = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: date_picker.date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)
        
        let identifier = "UYLLocalNotification"
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        center.add(request, withCompletionHandler: { (error) in
            if error != nil {
                print( "error")
            }
        })
        
    }
    
    func funcDatePicker(){
        self.date_picker.date = NSDate.init(timeIntervalSinceNow: 0) as Date
    }
    
    func gradientBgColor(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.forthBg.cgColor, UIColor.firstBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    func dateConvert(){
        let date = date_picker.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        dateString = dateFormatter.string(from:date as Date)
    }
    
}
