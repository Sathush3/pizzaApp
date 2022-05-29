//
//  PizzaFavouriteView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI
import CoreData

struct PizzaFavouriteView: View {
    // Retreiving core data to populate list view
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(entity: LikedPizza.entity(), sortDescriptors: []) var likedPizzas: FetchedResults<LikedPizza>

    
    var body: some View {
  
        Print(likedPizzas)
        List {
            ForEach(likedPizzas){ likes in
                
                    HStack{
                        Image(likes.imageNames ?? "Chicken")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text(likes.pizzaName ?? "beef_sizzler")
                        Spacer()
                        
                    }
                    
            }.onDelete(perform: deleteFavourites)
            
 
        }
        //.listStyle(PlainListStyle()) // PlainListStyle
      
    }
    
    
    private func deleteFavourites(offsets: IndexSet){
        withAnimation {
            offsets.map{likedPizzas[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
        
    }
}



struct PizzaFavouriteView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaFavouriteView( )
    }
}

