//
//  CellViewController.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 22.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 11.0, *)
class CellViewController: UIViewController {

    @IBOutlet weak var descTxtField: UITextField!
    @IBOutlet weak var taskTxtField: UITextField!
    
    var tasks : [Task] = []
    var vc : ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBgColor()
    }

    @IBAction func editBtn(_ sender: UIButton) {
        vc?.tableView.reloadData()
    }

    func gradientBgColor(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
