//
//  ContentView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-21.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView{
            PizzaMainView()
                .tabItem{
                    Image(systemName:"list.dash")
                    Text("Order")
                }
            PizzaFavouriteView()
                .tabItem{
                    Image(systemName:"star.fill")
                    Text("Favourites")
                }
        }
        //.preferredColorScheme(.dark)
        // dark mode copatibility check
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(PizzaData())
    }
}
