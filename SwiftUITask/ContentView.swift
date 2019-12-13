//
//  ContentView.swift
//  SwiftUITask
//
//  Created by 矢守叡 on 2019/12/04.
//  Copyright © 2019 yamolean. All rights reserved.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let age: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}

struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    @State private var showingAddExtense = false
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Text("Name")
                        .font(.title)
                    ForEach(expenses.items){ item in
                        Text(item.name)
                    }
                    Spacer()
                }
                HStack{
                    Spacer()
                    Text("Age")
                        .font(.title)
                    ForEach(expenses.items){ item in
                        Text("\(item.age)")
                    }
                    Spacer()
                }
                Spacer()
            }
            .navigationBarItems(trailing:
                NavigationLink(destination: UserEditView(expenses: self.expenses)){
                    Text("Edit")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
