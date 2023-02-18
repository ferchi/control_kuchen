//
//  NewDepScreen.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import SwiftUI

struct NewDepScreen: View {
    @ObservedObject var depViewModel: DepViewModel

    @State var numero: String = ""
    @State var instalador: String = ""
    @State var notas: String = ""
    @State var date = Date()
    @State var equipos: Bool = false
    @State var plomeria: Bool = false
    @State private var index = 0
    @State private var protoIndex = 0
    let estatusOptions = ["EN PROCESO", "TERMINADO", "ESTIMADO", "ENTREGADO"]
    let prototipoOptions = ["2/R", "3/R"]
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Nuevo Registro")) {
                    VStack(alignment: .leading){
                        Text("Número").font(.headline)
                        TextField("", text: $numero, prompt: Text("Ingresa el Número"))
                            .padding(.all)
                        Picker(selection: $protoIndex, label: Text("Prototipo")) {
                            ForEach(0 ..< 2) {
                                Text(self.prototipoOptions[$0])
                            }}
                        Text("Instalador").font(.headline)
                        TextField("", text: $instalador, prompt: Text("Ingresa el Instalador"))
                            .padding(.all)
                        DatePicker("Fecha", selection: $date, displayedComponents: .date)
                        Toggle(isOn: $equipos) {
                            Text("Equipos")
                        }
                        Toggle(isOn: $plomeria) {
                            Text("Plomeria")
                        }
                    }
                    VStack(alignment: .leading){
                        Picker(selection: $index, label: Text("Estatus")) {
                            ForEach(0 ..< 4) {
                                Text(self.estatusOptions[$0])
                            }}
                        Text("Notas").font(.headline)
                        TextField("", text: $notas, prompt: Text("Ingresa notas"), axis: .vertical)
                            .padding(.all)
                    }
                }
                
            }.padding(.horizontal, 16)
            
            Button("CREAR",action: {
               let dep = Departamento(
                numero: numero,
                prototipo: prototipoOptions[protoIndex],
                instalador: instalador,
                fecha: date,
                equipos: equipos,
                plomeria: plomeria,
                estatus: estatusOptions[index],
                notas: notas)
                depViewModel.createNewDep(dep: dep)
            }).buttonStyle(.bordered)
        }
    }
}
