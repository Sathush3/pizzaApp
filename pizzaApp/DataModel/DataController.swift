//
//  DataController.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-26.
//

import Foundation
import CoreData

//controller to handle CoreData
class DataController:ObservableObject{
    
    // Initializing CoreData container
    let container = NSPersistentContainer(name: "HistoryData")
    
    init(){
        
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
            
        }
        
        
        
    }
    // function to send data to save to the container
    func save(context:NSManagedObjectContext){
        
        do{
            try context.save()
            print("Data was saved successfully")
        }catch{
            print("Data couldnt be saved ")
            
        }
        
        
        
    }
    
    func addHistory(name:String , imageName: String, context: NSManagedObjectContext){
        
        let liked = LikedPizza(context: context)
        liked.favouriteID = UUID()
        liked.pizzaName = name
        liked.imageNames = imageName
        
        save(context: context)
    }
    
    func editFavourite( liked: LikedPizza , name: String, imageName: String , context: NSManagedObjectContext){
        
        liked.pizzaName = name
        liked.imageNames = imageName
        
        save(context: context)
        
    }
    
    
}

