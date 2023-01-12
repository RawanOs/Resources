//
//  EditSorcesView.swift
//  Sources
//
//  Created by Rawan on 18/06/1444 AH.
//

import SwiftUI

struct EditSorcesView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    var Resources: FetchedResults<Entity>.Element
    
    @State private var name = ""
    @State private var content = ""
    
    var body: some View {
        Form{
            Section{
                TextField("\(Resources.name!)", text: $name)
                    .onAppear {
                        name = Resources.name!
                        content = Resources.content!
                    }
                VStack{
                    TextEditor( text: $content)
                }
                .padding()
                HStack{

                    
//                    Button (action: {
//                    DataController().editResources(Resources: Resources, name: name, content: content, context: managedObjContext)
//                    dismiss()
//                    }, label: {
//                    Text("Save")
//                    .foregroundColor(Color("green2"))
//                    .font(.headline)
//                    .bold()
//                    .padding(.leading,50)
//                    Spacer()
//
//                    })
//                    Divider()
//                    .frame(width: 30,height: 35)
//                    .padding(.leading, 40)

                                        Button (action: {
                                            dismiss()
                                            
                                        }, label: {
                                            Text("Cancel")
                                               .foregroundColor(Color("green2"))
                                            
                                                .bold()
                                                .padding(.leading,50)
                                               
                                            Spacer()
                                            
                                            
                                        })
                    Divider()
                    .frame(width: 30,height: 35)
                    .padding(.leading, 40)
                    
                    Button (action: {
                    DataController().editResources(Resources: Resources, name: name, content: content, context: managedObjContext)
                    dismiss()
                    }, label: {
                    Text("Save")
                    .foregroundColor(Color("green2"))
                    .font(.headline)
                    .bold()
                    .padding(.leading,50)
                    Spacer()
                 
                    })
                    
                }
                
            }
        }
    }
}

//struct EditSorcesView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditSorcesView()
//    }
//}
