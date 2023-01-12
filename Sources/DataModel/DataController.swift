//
//  DataController.swift
//  Sources
//
//  Created by Rawan on 18/06/1444 AH.
//

import Foundation

import CoreData

class DataController : ObservableObject{
    let container = NSPersistentContainer(name: "Model")
    
    init() {
        container.loadPersistentStores {
            desc, error in
            if let error = error{
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save (context: NSManagedObjectContext){
        do {
            try context.save()
            print("Data saved ")
            
        } catch {
            print("Data dont save..")
        }
    }
    
    func addResources (name : String , content : String , context : NSManagedObjectContext){
        let Resources = Entity(context: context)
        Resources.id = UUID()
        Resources.name = name
        Resources.content = content
        Resources.date = Date()
        
        
        save(context: context)
    }
    
    func editResources( Resources:  Entity, name : String, content : String, context : NSManagedObjectContext ){
        Resources.name = name
        Resources.content = content
        Resources.date = Date()
        
        save(context: context)
    }
    

    
}
