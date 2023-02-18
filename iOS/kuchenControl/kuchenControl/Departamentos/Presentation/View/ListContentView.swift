//
//  RowView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct ListContentView: View {
    @ObservedObject var depViewModel: DepViewModel
    
    var body: some View {
        
            List {
                ForEach(depViewModel.deps) { dep in
                        RowView(dep: dep)
                }}.listStyle(.plain)
                .task {
                    depViewModel.getAllDeps()
                }
    }
}




struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        let depViewModel = DepViewModel()
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        ListContentView(depViewModel: depViewModel)
    }
}
