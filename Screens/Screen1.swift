//
//  Screen1.swift
//  CrazyMax
//
//  Created by Oybek To’laboyev on 28/09/21.
//

import SwiftUI

struct Screen1: View {
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    
    @State var isModul = false
    var body: some View {
        
        NavigationView{
            List{
                ForEach(tasks, id: \.id){ task in
                    HomeCell(task: task)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isModul = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModul, content: {
                Screen2()
            })
            
          )
                                
            .listStyle(PlainListStyle())
            .navigationBarTitle("Task List",displayMode: .inline)
        }
                      
        
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1()
    }
}
