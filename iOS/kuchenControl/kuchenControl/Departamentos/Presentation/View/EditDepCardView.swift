//
//  EditCardView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 18/02/23.
//

import SwiftUI

struct EditDepCardView: View {
    var dep:Departamento
    
    @State private var protoIndex = 0
    let estatusOptions = ["EN PROCESO", "TERMINADO", "ESTIMADO", "ENTREGADO"]
    @State private var index = 0
    @State var date = Date()
    @State var numero: String = ""
    @State var instalador: String = ""
    @State var notas: String = ""
    @State var equipos: Bool = false
    @State var plomeria: Bool = false
    
    
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
                    Picker(selection: $index, label: Text("Estatus")) {
                        ForEach(0 ..< 4) {
                            Text(self.estatusOptions[$0])
                        }}
                    Spacer()
                    DatePicker("", selection: $date, displayedComponents: .date)
                }
                Spacer()
                HStack(){
                    Spacer()
                    Text("Número: ")
                        .font(.title)
                        .foregroundColor(.black)
                    TextField("", text: $numero, prompt: Text(dep.numero))
                        .font(.title)
                }
                HStack{
                    Text("Instalador:").font(.title).font(.title)
                        .foregroundColor(.black)
                        .lineLimit(1)
                    TextField("", text: $instalador, prompt: Text(dep.instalador))
                        .padding(.all).font(.title)
                        .foregroundColor(.black)
                        .lineLimit(1)
                }
                Spacer()
                HStack{
                    Toggle(isOn: $equipos) {
                        Text("Equipos")
                    }
                    Toggle(isOn: $plomeria) {
                        Text("Plomeria")
                    }
                }
                Spacer()
                Text("Notas").font(.headline)
                TextField("", text: $notas, prompt: Text(dep.notas), axis: .vertical)
                    .padding(.all).multilineTextAlignment(.center)
            }
            .padding(16)
            
        }
        .frame(width: .infinity, height: 500).padding(10)
    }
}

struct EditDepCardView_Previews: PreviewProvider {
    static var previews: some View {
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        EditDepCardView(dep: dep)
    }
}
