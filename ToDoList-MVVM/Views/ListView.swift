//
//  ListView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listVM: ListViewModel
    
    var body: some View {
        ZStack {
            if listVM.items.isEmpty {
                BlankView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            } else {
                List {
                    ForEach(listVM.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    listVM.updateItem(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listVM.deleteItem)
                    .onMove(perform: listVM.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle("Todo List 🗒")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",
                               destination: AddView()
                              )
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

