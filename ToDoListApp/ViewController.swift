//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Sreya Guha on 10/27/17.
//  Copyright © 2017 Sreya Guha. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    var toDoList = ["walk the dog", "make the bed", "buy groceries", "mani-pedi", "call mom", "take out trash", "clean room", "do dishes", "brush teeth", "make app", "do homework", "buy presents",
                    "study for physics", "make toner", "moisturize", "wash face", "sweep"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindCancelNewToDo(unwindSegue: UIStoryboardSegue) {
        
    }
    @IBAction func unwindSaveNewToDo(unwindSegue: UIStoryboardSegue) {
        if let addTaskVC = unwindSegue.source as? AddTaskViewController{
            if addTaskVC.newTask.count != 0 {
                toDoList.append(addTaskVC.newTask)
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")
        let text = toDoList[indexPath.row]
        cell!.textLabel?.text = text
        return cell!
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}

