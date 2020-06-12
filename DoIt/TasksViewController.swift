//
//  TasksViewController.swift
//  DoIt
//
//  Created by Devi Krishna Lanka on 6/2/20.
//  Copyright © 2020 udemy. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []

    
    override func viewDidLoad() {
    super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
         
    }
    override func viewWillAppear(_ animated: Bool) {
    getTasks()
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important {
            cell.textLabel?.text = "❗️\(task.name!)"
        } else {
            cell.textLabel?.text = task.name!
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
        
   

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    func getTasks(){
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

                do {
            tasks = try context.fetch(Task.fetchRequest()) as!
                [Task]
            print(tasks)
        } catch  {
            print("OOPS WE HAVE AN ERROR")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
         if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as!
            CompleteTaskViewController
            nextVC.task = (sender as? Task)! 
        }
     }

    }

