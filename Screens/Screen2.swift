//
//  Screen2.swift
//  CrazyMax
//
//  Created by Oybek To’laboyev on 28/09/21.
//

import SwiftUI

struct Screen2: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var type: String = ""
    @State var email: String = ""
    @State var phone: String = ""
    @State var address: String = ""
    let types = ["Male","Female"]
    
    func saveTask(firstName: String, lastName: String, type: String, phone: String, email: String, address: String) {
        
        let task = Task(context: self.moc)
        
        task.id = UUID()
        task.firstName = firstName
        task.lastName = lastName
        task.type = type
        task.phone = phone
        task.email = email
        task.address = address
        try? self.moc.save()
    }
    

    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("Fistname",text: $firstName)
                    TextField("Lastname",text: $lastName)
                    Picker("Gender",selection: $type){
                        ForEach(types, id:\.self){
                            Text($0)
                        }
                    }
                }
                
                Section{
                    TextField("Phone",text: $phone)
                    TextField("Email",text: $email)
                    TextField("Address",text: $address)
                }
                
                
                
            }
            .navigationBarItems(trailing: Button(action: {
                saveTask(firstName: firstName, lastName: lastName, type: type, phone: phone, email: email, address: address)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            })
            
          )
                                
            
            .navigationBarTitle("Add Task",displayMode: .inline)
        }
    }
}

struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2()
    }
}
