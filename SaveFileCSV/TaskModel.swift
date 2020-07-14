//
//  TaskModel.swift
//  SaveFileCSV
//
//  Created by V.mio002 on 7/14/20.
//  Copyright © 2020 V.mio002. All rights reserved.
//

import Foundation
class TaskModel: NSObject {
    var date: String
    var name: String
    var dueDate: String
    var nameTask: String
    
    init(date: String, name: String, dueDate: String, nameTask: String) {
        self.date = date
        self.name = name
        self.dueDate = dueDate
        self.nameTask = nameTask
    }
}
