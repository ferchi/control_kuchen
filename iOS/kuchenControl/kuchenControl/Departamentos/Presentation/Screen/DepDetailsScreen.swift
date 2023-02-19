//
//  DepDetailsScreen.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import SwiftUI

struct DepDetailsScreen: View {
    @StateObject var depViewModel: DepViewModel = DepViewModel()
    @State private var isPresentingConfirm: Bool = false
    
    var dep:Departamento
    var body: some View {
        NavigationView{
            VStack{
                if(depViewModel.isEditing){ EditDepCardView(dep: dep) } else{ DepCardView(dep: dep) }
//                HStack{
//                    Image(systemName: depViewModel.isEditing ? "square.and.pencil" : "pencil" ).resizable().frame(width: 40, height: 40).onTapGesture {
//                        depViewModel.toEdit()
//                    }.padding()
//                    Image(systemName: "eraser.fill").resizable().frame(width: 40, height: 40).onTapGesture {
//                        isPresentingConfirm = true
//                    }.confirmationDialog("¿Estás seguro?",
//                                         isPresented: $isPresentingConfirm) {
//                        Button("ELIMINAR", role: .destructive) {
//                        }
//                    }.padding()
//                }
            }
        }
    }
}

struct DepDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        let depViewModel = DepViewModel()
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        DepDetailsScreen(depViewModel: depViewModel, dep: dep)
    }
}
