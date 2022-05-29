//
//  PizzaMainView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI


/*
 MARK: This app uses both Json storage read / write and core data for data storage and persistency
 
 MARK: JSON storage - Pizza saving
 MARK: Core Data - Favourites Saving
 
 */
 

struct PizzaMainView: View {
    @EnvironmentObject var pizzaData:PizzaData
    @State var selection:Int = 0
    @State var isAddPageShowing:Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                Picker("Pizza", selection: $selection) {
                    Text("All").tag(0)
                    Text("Meat").tag(1)
                    Text("Veg").tag(2)
                }.pickerStyle(.segmented)
                if selection == 1{
                    PizzaListView( selectedType: "meat" )
                }else if selection == 2{
                    PizzaListView( selectedType: "vegetarian" )
                }else if selection == 0{
                    PizzaListVIewUnfil()
                }
                
                
            }
            .navigationTitle("Pizza Shop")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $isAddPageShowing, content: { // Showing the sheet using a binding variable
                AddPizza(isPresented: $isAddPageShowing)// Sheet content
            })
            .toolbar {
                ToolbarItem{
                    Button {
                        //link to add page
                        isAddPageShowing.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }

                }
                }
        }
        
    }
}

struct PizzaMainView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaMainView().environmentObject(PizzaData())
    }
}
