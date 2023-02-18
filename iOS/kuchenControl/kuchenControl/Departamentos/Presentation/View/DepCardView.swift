//
//  DepCardView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import SwiftUI

struct DepCardView: View {
    var dep:Departamento
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(.white).shadow(
                    color: Color.gray.opacity(0.7),
                    radius: 8,
                    x: 0,
                    y: 0
                )

            VStack{
                HStack{
                    Text(dep.estatus)
                        .font(.headline)
                        .foregroundColor(.white)
                        .background(getBackgroundColor(estatus: dep.estatus))
                    Spacer()
                    Text(dep.fecha.formatted(date: .abbreviated, time: .omitted))
                        .font(.headline)
                        .foregroundColor(.gray)
                }
                Spacer()
                HStack{
                    Text("Número: \(dep.numero)")
                        .font(.title)
                        .foregroundColor(.black)
                }
                HStack{
                    Text(dep.instalador)
                        .font(.title)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
                Spacer()
                HStack{
                    Toggle(isOn: .constant(dep.equipos)) {
                        Text("Equipos")
                    }.toggleStyle(CheckBoxStyle())
                    Toggle(isOn: .constant(dep.plomeria)) {
                        Text("Plomeria")
                    }.toggleStyle(CheckBoxStyle())
                }
                Spacer()
                Text(dep.notas).multilineTextAlignment(.center)
            }
            .padding(16)
            
        }
        .frame(width: .infinity, height: 250).padding(10)
    }
}

struct DepCardView_Previews: PreviewProvider {
    static var previews: some View {
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        DepCardView(dep: dep)
    }
}
