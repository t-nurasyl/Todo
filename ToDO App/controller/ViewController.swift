//
//  ViewController.swift
//  ToDO App
//
//  Created by Toleukadyr Nurasyl on 21.04.2018.
//  Copyright © 2018 Toleukadyr Nurasyl. All rights reserved.
//

import UIKit
import CoreData

@available(iOS 11.0, *)

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var detailViewController: CellViewController? = nil
    var managedObjectContext: NSManagedObjectContext? = nil
    var person = [NSManagedObject]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var tasks: [Task] = []
    
    let cellSpacingHeight: CGFloat = 5
    
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getData()
    tableViewEdited()
    tableView.reloadData()
    
  }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        let task = tasks[indexPath.section]
        
            cell.title.text = task.name
            cell.date.text = task.date
    
        cell.backgroundColor = UIColor.sixthBg
        cell.layer.borderWidth = 4
        cell.title.textColor = .white
        cell.date.textColor = .white
        cell.clipsToBounds = true
        cell.layer.borderColor = UIColor.firstBg.cgColor

        return cell
       }

      func getData() {
        do {
          tasks = try context.fetch(Task.fetchRequest())
        }
        catch {
          print("Fetching Failed")
        }
      }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let closeAction = UIContextualAction(style: .normal, title:  "Done", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let task = self.tasks[indexPath.section]
            self.context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                self.tasks = try self.context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
            tableView.reloadData()
            
            success(true)
        })
        closeAction.image = UIImage(named: "tick")
        closeAction.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [closeAction])
        
    }
    
    func tableView(_ tableView: UITableView,
                   trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration?
    {
        let modifyAction = UIContextualAction(style: .normal, title:  "Delete", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let task = self.tasks[indexPath.section]
            self.context.delete(task)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                self.tasks = try self.context.fetch(Task.fetchRequest())
            }
            catch {
                print("Fetching Failed")
            }
            tableView.reloadData()
            success(true)
        })
        modifyAction.image = UIImage(named: "delete")
        modifyAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [modifyAction])
    }
    
    func tableViewEdited(){
        let backgroundImage = UIImage(named: "w.jpg")
        let imageView = UIImageView(image: backgroundImage)
        tableView.separatorStyle = .none
        tableView.backgroundColor = .firstBg
        self.tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "myCell")
        
        let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = imageView.bounds
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTask"{
            let controller = segue.destination as! CellViewController
            controller.taskTxtField.text = tasks[(tableView.indexPathForSelectedRow?.section)!].name!
            controller.descTxtField.text = tasks[(tableView.indexPathForSelectedRow?.section)!].date!
        }
    }
    

}

