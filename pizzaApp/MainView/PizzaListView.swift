//
//  PizzaListView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI

struct PizzaListView: View {
    @EnvironmentObject var pizzaData: PizzaData
    @State var selectedType:String
    
    var body: some View {
        //Print("pizza data \(pizzaData.pizzaArray)")
        // list sub view for ease of customizability and reusability
        VStack(){
            NavigationView{
                List(pizzaData.pizzaArray.filter({$0.type == selectedType})){ item in
                    NavigationLink(destination: PizzaDetailView(selectedPizza: item)){

                            PizzaRowView(name: item.name, imageName: item.imageName)
                                .listRowInsets(EdgeInsets())
                        }
                        
                        
                        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                            Button(role:.destructive){
                                pizzaData.pizzaArray.removeAll(where: { $0.id == item.id })
                                pizzaData.writeJSON()
                                
                                
                            }label: {
                                Label {
                                   Text( "Delete")
                                } icon: {
                                    Image(systemName: "trash")
                                }

                            } // .background(Color.red)
                           
                    }
                    
                    
                        
                }.listStyle(.inset)
                 .navigationBarHidden(true)
                 
            }
                
        }
    }
}
extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}


struct PizzaListView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListView(selectedType:"meat" ).environmentObject(PizzaData())
    }
}
