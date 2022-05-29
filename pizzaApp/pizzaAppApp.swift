//
//  pizzaAppApp.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-21.
//

import SwiftUI

@main
struct pizzaAppApp: App {
    @StateObject private var dataController  = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(PizzaData())
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
