//
//  AddView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

struct AddView: View {
    
    @State private var txt: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type here...", text: $txt)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(.lightGray))
                    .cornerRadius(15)
                
                Button {
                    //
                } label: {
                    Text("Save".uppercased())
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                }

            }
            .padding(15)
        }
        .navigationTitle("Add an item ✏️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
    }
}
