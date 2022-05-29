//
//  PizzaListVIewUnfil.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI

struct PizzaListVIewUnfil: View {
    @EnvironmentObject var pizzaData: PizzaData
   
    var body: some View {
        VStack(){
            NavigationView{
                List(pizzaData.pizzaArray){ item in
                    
                    NavigationLink(destination: PizzaDetailView(selectedPizza: item)){

                            PizzaRowView(name: item.name, imageName: item.imageName)
                                .listRowInsets(EdgeInsets())
                        }
                        
                        
                        .swipeActions(edge: .trailing, allowsFullSwipe: false) {
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


struct PizzaListVIewUnfil_Previews: PreviewProvider {
    static var previews: some View {
        PizzaListVIewUnfil().environmentObject(PizzaData())
    }
}
