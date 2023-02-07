//
//  ContentView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let examples = Departamento.sampleData
    
        ZStack(alignment: .topTrailing){
            List {
                Text("Lista de control")
                .font(.system(size: 32))
                
                Section(header: HStack {
                    HeaderView()
                }) {
                    ForEach(examples) { example in
                        RowView(dep: example)
                    }
                }
            }.listStyle(.plain)
            
            FabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
