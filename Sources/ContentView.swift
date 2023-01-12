//
//  ContentView.swift
//  Sources
//
//  Created by Rawan on 18/06/1444 AH.
//

import SwiftUI
import CoreData
import Accessibility


struct ContentView: View {
    @Environment (\.managedObjectContext) var managedObjContext
   
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var Resources: FetchedResults<Entity>
    
    @State  var query = ""
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
               
                List{
                    ForEach(Resources){ Resources in
                        NavigationLink(destination: EditSorcesView(Resources: Resources)) {
                            
                            HStack{
                                VStack(alignment: .leading, spacing: 6) {
                                    ZStack {
                                        
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(Color(.white))
                                            .frame(width: 341, height: 83)
                                        
                                            .overlay(
                                                
                                                RoundedRectangle(cornerRadius: 10)
                                                
                                                    .stroke(Color(.white), lineWidth: 1)
                                                
                                            )
                                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 1, y: 1)
                                        Color("green").frame(width: 8 , height: 83)
                                            .cornerRadius(5)
                                            .padding(.leading,-170)
                                        Text(Resources.name!)
                                            .bold()
                                            .font(.title)
                                            .foregroundColor(.black)
                                            .padding(.leading)
                                        
                                        
                                    }
                                 
                                }
                                Spacer()
                              
                            }
                            
                        }

                        
                    }
                    .onDelete(perform: deletResources)
                    .listRowSeparator(.hidden, edges: .bottom)

                }
                .listStyle(.plain)
                
            }.navigationTitle("Resources")
                .scrollContentBackground(.hidden)
                .searchable(text: $query)
                .onChange(of: query) { newValue in
                    Resources.nsPredicate = searchPredicate(query: newValue)
                }
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            showingAddView.toggle()
                        } label: {
                            Label("Add Resources", systemImage: "plus")
                                .foregroundColor(Color("green2"))
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()
                            .foregroundColor(Color("green2"))
                    }
                }
                .sheet(isPresented: $showingAddView) {
                    AddSorcesView()
                }
            
        }
        .accentColor(Color("green2"))
        .navigationViewStyle(.stack)
        
   
        
    }
    
    private func deletResources(offsets: IndexSet) {
        withAnimation{
            offsets.map {Resources[$0]}.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }

    private func searchPredicate(query: String) -> NSPredicate? {
      if query.isEmpty { return nil }
        return NSPredicate(format: "%K BEGINSWITH[cd] %@",  #keyPath(Entity.name), query )
   
      }
                           
}
    

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
      
    }
}
