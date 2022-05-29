//
//  PizzaData.swift
//  pizzaApp
//
//  Created by Sathurshan Ramachandran on 2022-05-22.
//

import Foundation
// MARK: class to decode and encode JSON file with data
class PizzaData: ObservableObject {
    @Published var pizzaArray : [Pizza] // The Published wrapper marks this value as a source of truth for the view
    
    init() {
        print("Start of app")
        self.pizzaArray = Bundle.load("Pizzas") // Initailizing the array from a json file
        print(" pizzaArray Data:   \(pizzaArray)")
    }
    
    
    // function to write the json data into the file manager
    func writeJSON() {
        
        
        if let stringPath = Bundle.main.path(forResource: "Pizzas", ofType: "json") {
            print("stringPath: \(stringPath)")
            // need to add data to original json listing
            //https:www.hackingwithswift.com/example-code/system/how-to-find-the-path-to-a-file-in-your-bundle
        }
            
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let jsonURL = documentDirectory
                .appendingPathComponent("Pizzas")
                .appendingPathExtension("json")
            try? JSONEncoder().encode(pizzaArray).write(to: jsonURL, options: .atomic)
            print("jsonURL: \(jsonURL)")
            
            
        }
    }


// Function to load data
extension Bundle {
    static func load<T: Decodable>(_ filename: String) -> T {
        
        let readURL = Bundle.main.url(forResource: filename, withExtension: "json")! //Example json file in our bundle
        print("readURL:   \(readURL)")
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first! // Initializing the url for the location where we store our data in filemanager
        print("documentDirectory read :  \(documentDirectory)")
        let jsonURL = documentDirectory // appending the file name to the url
            .appendingPathComponent(filename)
            .appendingPathExtension("json")
        
        // The following condition copies the example file in this bundle to the correct location if it isnt present
        if !FileManager.default.fileExists(atPath: jsonURL.path) {
            try? FileManager.default.copyItem(at: readURL, to: jsonURL)
        }
        
        // returning the parsed data
        return try! JSONDecoder().decode(T.self, from: Data(contentsOf: jsonURL))
    }
}

