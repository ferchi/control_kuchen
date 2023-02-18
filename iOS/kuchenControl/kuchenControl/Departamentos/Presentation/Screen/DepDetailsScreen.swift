//
//  DepDetailsScreen.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import SwiftUI

struct DepDetailsScreen: View {
    var dep:Departamento
    var body: some View {
        NavigationView{
            VStack{
                DepCardView(dep: dep)
                HStack{
                    Image(systemName: "square.and.pencil").resizable().frame(width: 25, height: 25)
                    Image(systemName: "eraser.fill").resizable().frame(width: 25, height: 25)
                }
            }
        }
    }
}

struct DepDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        DepDetailsScreen(dep: dep)
    }
}
