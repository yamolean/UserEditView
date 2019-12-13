//
//  UserEditView.swift
//  SwiftUITask
//
//  Created by 矢守叡 on 2019/12/04.
//  Copyright © 2019 yamolean. All rights reserved.
//

import SwiftUI

struct UserEditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var age = ""
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text("Name")
                TextField("Name",text: $name)
                    .frame(width: 50, height: 50)
            }
            HStack{
                Text("Age")
                TextField("Age",text: $age)
                    .keyboardType(.numberPad)
                    .frame(width: 50, height: 50)
            }
            Spacer()
        }
        .navigationBarItems(trailing:
            Button("Save") {
                if let writtenAge = Int(self.age) {
                    let item = ExpenseItem(name: self.name, age: writtenAge)
                    self.expenses.items.append(item)
                    self.presentationMode.wrappedValue.dismiss()
                }
        })
    }
}

struct UserEditView_Previews: PreviewProvider {
    static var previews: some View {
        UserEditView(expenses: Expenses())
    }
}
