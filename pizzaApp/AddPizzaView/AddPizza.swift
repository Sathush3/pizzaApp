//
//  AddPizza.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-21.
//

import SwiftUI

struct AddPizza: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var pizzaData: PizzaData
    @Binding var isPresented:Bool
    @State var name:String = ""
    @State var ingrediants:String = ""
    @State var imageName:String = ""
    @State var thumbnailName:String = ""
    @State var type:String = ""
    @State var detailsEnteredWrong:Bool = false
    //let pizzaTypes = ["meat","vegetarian"]
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray
                    .opacity(0.3)
                VStack(spacing:15){
                    TextField("Enter Pizza Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(TextInputAutocapitalization.words)
                        
                    
                    TextEditor(text: $ingrediants)
                        .frame(height: 200)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(TextInputAutocapitalization.words)
                    TextField("Enter Image name", text: $imageName)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                    TextField("Enter Thumbnail name", text: $thumbnailName)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
                    
                    Picker(selection: $type, label: Text("Type Selector")) {
                        Text("Meat").tag("meat")
                        Text("Vegetarian").tag("vegetarian")
//                        ForEach(self.pizzaTypes, id: \.self) { types in
//                                        HStack {
//                                            Text(types).tag(types)
//
//                                        }.background(Color.gray)
//                                    }
                    }.pickerStyle(.segmented)
                        .frame( height: 50, alignment: .leading)
                        .background(Color.white)
                        
                   
                     Spacer()
                }.padding()
            }
            .navigationTitle("Add Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        self.isPresented = false
                    } label: {
                        Text("Back")
                        
                }
                }
                ToolbarItem (placement:.navigationBarTrailing) {
                    Button{
                        //save function for JSON
                        if(name == "" || ingrediants == "" || imageName == "" || type == ""){
                            detailsEnteredWrong = true
                            // input validation checked
                        }else{
                            let newPizzaName = self.name.trimmingCharacters(in: .whitespaces)
                            let newIngrediants = self.ingrediants.trimmingCharacters(in: .whitespaces)
                            let newImage = self.imageName.trimmingCharacters(in: .whitespaces)
                            let newThumbnailImage = self.thumbnailName.trimmingCharacters(in: .whitespaces)
                            let newType = self.type.trimmingCharacters(in: .whitespaces)
                            if !newPizzaName.isEmpty && !newIngrediants.isEmpty && !newImage.isEmpty &&
                                !newThumbnailImage.isEmpty &&
                                !newType.isEmpty{
                                pizzaData.pizzaArray.append(Pizza(id: UUID(), name: name, ingredients: ingrediants,imageName: imageName, thumbnailName: thumbnailName,type: type))
                                pizzaData.writeJSON()
                                
                                self.presentationMode.wrappedValue.dismiss()
                            
                        
                            }
                            
                        }
                    }label: {
                        Text("Save")
                }
                }
            }
            .alert(isPresented: $detailsEnteredWrong) {
                               Alert(title: Text("Error"), message: Text("One or more fields are Empty"))
                
                          }
        }
        
            
    }
}


struct AddPizza_Previews: PreviewProvider {
    static var previews: some View {
        AddPizza(isPresented: .constant(true) ,name: testPizza.name, ingrediants: testPizza.ingredients, imageName: testPizza.imageName, type: testPizza.type)
    }
}
