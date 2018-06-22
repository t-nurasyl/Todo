//
//  CollectionViewController.swift
//  ToDO App
//
//  Created by Нурасыл on 21.04.2018.
//  Copyright © 2018 BobtheDeveloper. All rights reserved.
//

import UIKit
import CenteredCollectionView
class CollectionViewController: UIViewController, UICollectionViewDataSource,UICollectionViewDelegate {
    var tasks: [Task] = []
    
    
    @IBOutlet weak var label: UILabel!
    
    lazy var titleLabel: UILabel = {
        var titleLabel = UILabel(frame: .zero)
//        titleLabel.text = "Password"
        titleLabel.textColor = .gray
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        return titleLabel
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell",
                                                      for: indexPath)
        cell.backgroundColor = UIColor.white
        
//        titleLabel.text = tasks[indexPath.row].name
        return cell
    }
    

    @IBOutlet weak var collection_view: UICollectionView!
    
    let cellPercentWidth: CGFloat = 0.7
    var centeredCollectionViewFlowLayout: CenteredCollectionViewFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()
        gradientBgColor()

        // Get the reference to the `CenteredCollectionViewFlowLayout` (REQURED STEP)
        centeredCollectionViewFlowLayout = collection_view.collectionViewLayout as! CenteredCollectionViewFlowLayout
        
        // Modify the collectionView's decelerationRate (REQURED STEP)
        collection_view.decelerationRate = UIScrollViewDecelerationRateFast
        
        // Assign delegate and data source
        collection_view.delegate = self //as! UICollectionViewDelegate
        collection_view.dataSource = self //as! UICollectionViewDataSource
        
        // Configure the required item size (REQURED STEP)
        centeredCollectionViewFlowLayout.itemSize = CGSize(
            width: view.bounds.width * cellPercentWidth,
            height: view.bounds.height * cellPercentWidth * cellPercentWidth
        )
        
        // Configure the optional inter item spacing (OPTIONAL STEP)
        centeredCollectionViewFlowLayout.minimumLineSpacing = 20
        
        // Get rid of scrolling indicators
        collection_view.showsVerticalScrollIndicator = false
        collection_view.showsHorizontalScrollIndicator = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    func gradientBgColor(){
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.firstBg.cgColor, UIColor.secondBg.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }

}
