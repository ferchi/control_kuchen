//
//  RowView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct RowView: View {
    var dep: Departamento
    var body: some View {
        let format = dep.fecha.formatted(date: .abbreviated, time: .omitted)
        ScrollView(.horizontal){
            HStack{
                Text(dep.numero).frame(width: 50)
                Text(dep.prototipo).frame(width: 50)
                Text(dep.instalador).frame(width: 150)
                Text(format).frame(width: 100)
                Toggle(isOn: dep.$equipos) {}.toggleStyle(CheckBoxStyle()).frame(width: 50)
                Toggle(isOn: dep.$plomeria) {}.toggleStyle(CheckBoxStyle()).frame(width: 50)
                Text(dep.estatus).frame(width: 150)
                Text(dep.notas).lineLimit(1).frame(width: 150, height: 50)
            }.frame(width: 800)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var dep = Departamento.sampleData[0]
    static var previews: some View {
        RowView(dep: dep)
    }
}
