//
//  ViewController.swift
//  SaveFileCSV
//
//  Created by V.mio002 on 7/14/20.
//  Copyright © 2020 V.mio002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var task = [TaskModel]()
    
    @IBOutlet weak var nameTextFiled: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var taskTextField: UITextField!
    @IBOutlet weak var dueTimeTextFiled: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func saveFileButtonTapped(_ sender: UIButton) {
        let taskData: TaskModel = TaskModel(date: timeTextField.text ?? "", name: nameTextFiled.text ?? "", dueDate: dueTimeTextFiled.text ?? "", nameTask: taskTextField.text ?? "")
        self.task.append(taskData)
        self.creatCSV()
    }
    
    @IBAction func resetTextFiledButtonTapped(_ sender: UIButton) {
        nameTextFiled.text = ""
        timeTextField.text = ""
        taskTextField.text = ""
        dueTimeTextFiled.text = ""
    }
    
    // MARK: CSV file creating
    func creatCSV() -> Void {
        let fileName = "Tasks.csv"
        let path = getDocumentsDirectory().appendingPathComponent(fileName)
        var csvText = "Name,Task Name,Date,Dealine\n"

        for task in task {
            let newLine = "\(task.name),\(task.nameTask),\(task.date),\(task.dueDate)\n"
            csvText.append(newLine)
        }

        do {
            try csvText.write(to: path, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            print("Failed to create file")
            print("\(error)")
        }
        print(path ?? "not found")
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

