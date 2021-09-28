//
//  HomeCell.swift
//  CrazyMax
//
//  Created by Oybek To’laboyev on 28/09/21.
//

import SwiftUI

struct HomeCell: View {
    @Environment(\.managedObjectContext) var moc
    var task: Task
    
    var body: some View {
        HStack(alignment: .top){
            VStack(alignment: .leading){
            HStack{
                Text(task.firstName!).fontWeight(.bold)
                Text(task.lastName!).fontWeight(.bold)
                Spacer()
            }
        
                
            Text("\(task.phone!) | \(task.email!) ")
            
            
                HStack{
            Text(task.address!)
                    Spacer()
                }
        }
            Spacer()
            HStack{
            Text(task.type!).foregroundColor(Color.red)
                Button(action: {
                    moc.delete(task)
                }) {
                    Image(systemName: "trash")
                }
                
            }
        }
            
        .padding(.top,10).padding(.bottom,10)
}
}

struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeCell(task: Task())
    }
}
