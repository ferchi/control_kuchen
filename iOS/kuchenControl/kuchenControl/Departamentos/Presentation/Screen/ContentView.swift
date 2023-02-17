//
//  ContentView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var depViewModel: DepViewModel = DepViewModel()
    @Environment(\.defaultMinListRowHeight) var minRowHeight

    var body: some View {
        NavigationView{
            ZStack(alignment: .topTrailing){
                List {
                    Text("Lista de control")
                        .font(.system(size: 32))
                    
                    Section(header: HStack {
                        HeaderView()
                    }) {
                        RowView(depViewModel: depViewModel).frame(minHeight: minRowHeight * 15)
                    }
                }.listStyle(.plain)
                NavigationLink(destination: NewDepScreen(depViewModel: depViewModel)) {
                    FabView()
                }
            }
        }.navigationTitle("Lista de control").frame(width: .infinity, height: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
