//
//  CustomTableViewCell.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 21.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var backingView: UIView!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var color: UIColor? {
        didSet {
            backingView.backgroundColor = color
        }
    }
    
    override func awakeFromNib() {
        backingView.layer.cornerRadius = 12
        backingView.layer.masksToBounds = true
    }
}
