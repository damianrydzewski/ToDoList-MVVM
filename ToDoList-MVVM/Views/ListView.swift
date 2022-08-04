//
//  ListView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

struct ListView: View {
    
    @State private var items: [ItemModel] = [
        ItemModel(title: "first item", isCompleted: true),
        ItemModel(title: "second item", isCompleted: false)

    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: deleteItem)
            .onMove(perform: moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 🗒")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",
                               destination: AddView()
                              )
        )
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
    }
}

