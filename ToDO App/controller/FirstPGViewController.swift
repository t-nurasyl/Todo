//
//  FirstPGViewController.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 21.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
import CoreData

let defa = UserDefaults.standard

class FirstPGViewController: UIViewController {
    
    @IBOutlet weak var bckgImage: UIImageView!
    @IBOutlet weak var profile_name: UITextField!
    @IBOutlet weak var profile_reason: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        bckgFunc()
        
        if UserDefaults.standard.bool(forKey: "isLoggedIn") == true{
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVc")
            self.navigationController?.pushViewController(homeVC!, animated: false)
        }
    }
    
    @IBAction func start_btn(_ sender: Any) {
        let text = profile_name.text!
        defa.set("\(text)", forKey: "save")
        
        let reas = profile_reason.text!
        defa.set("\(reas)", forKey: "reason")
        
        if self.profile_name.text == "" || self.profile_reason.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter an name and reason.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVc")
            self.navigationController?.pushViewController(homeVC!, animated: false)
            UserDefaults.standard.set(true, forKey: "isLoggedIn")
            
        }
}
    func bckgFunc(){
        let blurEffect = UIBlurEffect(style: .dark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = bckgImage.bounds
        bckgImage.addSubview(visualEffectView)
    }

}
