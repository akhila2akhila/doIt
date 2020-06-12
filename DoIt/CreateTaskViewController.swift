//
//  CreateTaskViewController.swift
//  DoIt
//
//  Created by Devi Krishna Lanka on 6/8/20.
//  Copyright © 2020 udemy. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
    let task = Task(context: context)
    
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
         (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
        navigationController!.popViewController(animated: true)
       
    
    }
}

