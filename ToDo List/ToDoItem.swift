//
//  ToDoItem.swift
//  ToDo List
//
//  Created by Jacob Ulrich on 12/4/17.
//  Copyright © 2017 Jacob Ulrich. All rights reserved.
//

import Foundation


class ToDoItem {
    //MARK: Properties
    
    var title: String
    
    init?(title: String) {
        if title.isEmpty {
            return nil
        }
        
        self.title = title
    }
}
