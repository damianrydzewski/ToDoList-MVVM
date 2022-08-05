//
//  ListRowView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            if !item.isCompleted {
                Text(item.title)
            } else {
                Text(item.title)
                    .strikethrough()
            }
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 5)
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "first", isCompleted: true)
    static var item2 = ItemModel(title: "second", isCompleted: false)

    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
 
