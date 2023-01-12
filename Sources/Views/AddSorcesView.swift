//
//  AddSorcesView.swift
//  Sources
//
//  Created by Rawan on 18/06/1444 AH.
//

import SwiftUI

struct AddSorcesView: View {
    @Environment (\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var content = ""
    
    
    
    var body: some View {
        Form {
            Section{
                TextField("Resources Title", text: $name)
                
                VStack{
                    TextEditor( text: $content)
                }
                
                .padding()
                
                HStack{
                    Spacer()
                    Button{
                        DataController().addResources(name: name, content: content, context: managedObjContext)
                            dismiss()
                    }
                label: {
                    Text("Save")
                        .foregroundColor(Color("green2"))
                }
                    Spacer()
                }
            }
        }
    }
}

struct AddSorcesView_Previews: PreviewProvider {
    static var previews: some View {
        AddSorcesView()
    }
}
