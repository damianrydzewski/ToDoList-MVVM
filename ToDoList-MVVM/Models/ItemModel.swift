//
//  ItemModel.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
