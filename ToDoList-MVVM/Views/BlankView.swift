//
//  BlankView.swift
//  ToDoList-MVVM
//
//  Created by Damian on 08/12/2022.
//

import SwiftUI

struct BlankView: View {
    
    @State private var animate = false
    
    var body: some View {
        ScrollView {
            VStack(spacing:12) {
                Group {
                    Text("There are no items!")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Text("Do you have a lot work to do? And not enough power to memorize all of it? Don't bother! Take it easy and just click here and save what you want.")
                }
                .padding(14)
                .background(Color.gray.opacity(0.1))
                .cornerRadius(20)
                
                NavigationLink(destination: AddView()) {
                    Text("Add Task 🥳")
                        .padding(8)
                        .padding(.horizontal, 20)
                        .foregroundColor(animate ? .black : .white)
                        .font(.headline)
                        .background(animate ? Color.yellow : Color.accentColor)
                        .cornerRadius(20)
                        .shadow(
                            color: animate ? .yellow.opacity(0.6) : .blue.opacity(0.6),
                            radius: animate ? 20 : 7,
                            y: 20
                            
                        )
                        .scaleEffect(animate ? 1.1 : 1.0)
                        .rotationEffect(Angle(degrees: animate ? 5 : 0))
                }
            }
            .multilineTextAlignment(.center)
            .padding(50)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation() {
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct BlankView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            BlankView()
                .navigationTitle("Title")
        }
    }
}
