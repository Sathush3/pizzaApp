//
//  PizzaRowView.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import SwiftUI

struct PizzaRowView: View {
    @State var name:String
    @State var imageName:String
    
    var body: some View {
        // row sub view for ease of reusability and customizability
            HStack(alignment: .center, spacing: 15){
                Image(imageName)
                    .resizable()
                    .frame(width: 100, height: 100)
                    
                    .cornerRadius(20)
                    
                Text(name)
                    .font(.title2)
                Spacer()
                
            
            }.padding(.leading)
    }
}

struct PizzaRowView_Previews: PreviewProvider {
    static var previews: some View {
        PizzaRowView(name: "chicken sizzler", imageName: "chicken_sizzler")
    }
}
