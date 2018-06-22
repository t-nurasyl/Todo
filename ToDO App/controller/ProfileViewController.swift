//
//  ProfileViewController.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 22.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
import CoreData

let defaults = UserDefaults.standard

class ProfileViewController: UIViewController {

    @IBOutlet weak var profile_name_label: UILabel!
    @IBOutlet weak var profile_reason_label: UILabel!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBgColor()
        
        if let saveName = defa.string(forKey: "save"){
            self.profile_name_label.text! = "\(saveName) "
        }
        
        if let saveReason = defa.string(forKey: "reason"){
            self.profile_reason_label.text! = "\(saveReason) "
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "isLoggedIn")
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func gradientBgColor(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
        
        profile_name_label.textColor = .white
        profile_reason_label.textColor = .white
    }

}
