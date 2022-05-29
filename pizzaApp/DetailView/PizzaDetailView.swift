//
//  PizzaDetailView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI

struct PizzaDetailView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State var name:String = ""
    @State var imageName: String = ""
    
    let selectedPizza: Pizza
    //@ObservedObject var favouriteModel:FavouriteModel
    @State var favAdd:Bool = false
    
    
    
    var body: some View {
        NavigationView {
            Form  {
                    Image(selectedPizza.imageName)
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(selectedPizza.name)
                        .font(.headline)
                    
                    Text(selectedPizza.ingredients)
                        .font(.body)
                    
                    HStack {
                        Text("Type").font(.headline)
                        Spacer()
                        Text(selectedPizza.type)
                    }.padding(.trailing)
                    HStack(alignment:.center) {
                        Spacer()
                        //MARK:  Passing data to core data Favourites
                        Button("Add to Favourites"){
                            DataController().addHistory(name: selectedPizza.name, imageName: selectedPizza.imageName, context: managedObjContext)
                            dismiss()
                        }
                        Spacer()
                            .alert(isPresented: $favAdd){
                                Alert(title: Text("Pizza Added"), message: Text("You added  " + self.selectedPizza.name + " to favourites" ))
                               
                            }
                    }
                        

                    
                
            }.navigationBarHidden(true)
            .toolbar {
                            ToolbarItem(placement: .principal) {
                                // this sets the screen title in the navigation bar, when the screen is visible
                                Text("Pizza")
                            }
                        }
        }
        
           
        
    }
        
    }


struct PizzaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaDetailView( selectedPizza: testPizza)
    }
}
