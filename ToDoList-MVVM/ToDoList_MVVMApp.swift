//
//  ToDoList_MVVMApp.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

@main
struct ToDoList_MVVMApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
        }
    }
}
