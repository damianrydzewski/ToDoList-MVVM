//
//  ListViewModel.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    
    
    init(){
        getItems()
    }
    
    
    
    func getItems() {
        let newItems = [ItemModel(title: "first item", isCompleted: true),
                        ItemModel(title: "second item", isCompleted: false)]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(item: String) {
        let newItem = ItemModel(title: item, isCompleted: false)
        items.append(newItem)
    }
    
}
