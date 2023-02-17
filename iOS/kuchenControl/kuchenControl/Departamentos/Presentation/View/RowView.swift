//
//  RowView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct RowView: View {
    @ObservedObject var depViewModel: DepViewModel
    
    var body: some View {
        List {
            ForEach(depViewModel.deps) { dep in
                let format = dep.fecha.formatted(date: .abbreviated, time: .omitted)
                ScrollView(.horizontal){
                    HStack{
                        Text(dep.numero).frame(width: 50)
                        Text(dep.prototipo).frame(width: 50)
                        Text(dep.instalador).frame(width: 150).lineLimit(1)
                        Text(format).frame(width: 100)
                        Toggle(isOn: .constant(dep.equipos)) {}.toggleStyle(CheckBoxStyle()).frame(width: 50)
                        Toggle(isOn: .constant(dep.plomeria)) {}.toggleStyle(CheckBoxStyle()).frame(width: 50)
                        Text(dep.estatus).frame(width: 150).lineLimit(1)
                        Text(dep.notas).lineLimit(1).frame(width: 150, height: 50).lineLimit(1)
                    }.frame(width: 800)
                }
            }}.task {
                depViewModel.getAllDeps()
            }
    }
}
