//
//  SourcesApp.swift
//  Sources
//
//  Created by Rawan on 18/06/1444 AH.
//

import SwiftUI

@main
struct SourcesApp: App {
    
@StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            Splash()
//            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
            
//                      Splash()
        }
    }
}
