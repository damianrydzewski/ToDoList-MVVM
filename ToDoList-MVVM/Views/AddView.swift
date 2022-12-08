//
//  AddView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 04/08/2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var txt: String = ""
    
    @State private var showAlert: Bool = false
    @State private var alertText: String = ""
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Enter the task...", text: $txt)
                    .padding(.horizontal)
                    .frame(height: 50)
                    .background(Color(red: 237/255, green: 237/255, blue: 237/255))
                    .cornerRadius(25)
                
                HStack {
                    Spacer()
                    Button(action: saveButton, label: {
                        Text("Save".uppercased())
                            .bold()
                            .frame(height: 40)
                            .frame(maxWidth: 100)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(30)
                            .shadow(radius: 5)
                    })
                }
            }
            .scaleEffect(x: -1, y: -1, anchor: .center)
            .padding(15)
        }
//        .rotationEffect(Angle(degrees: 180))
        .scaleEffect(x: -1, y: -1, anchor: .center)
        .navigationTitle("Add an item ✏️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton() {
        if enoughLetters() {
            listViewModel.addItem(item: txt)
            presentationMode.wrappedValue.dismiss()
        } else {
            alertText = "The item must contains at least 3 characters."
            showAlert.toggle()
        }

    }
    
    func enoughLetters() -> Bool {
        if txt.count < 3 {
            return false
        } else {
            return true
        }
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertText))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
