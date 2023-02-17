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
    @State var prototipo: String = ""
    @State var instalador: String = ""
    @State var notas: String = ""
    @State var date = Date()
    @State var equipos: Bool = false
    @State var plomeria: Bool = false
    @State private var index = 0
    let estatusOptions = ["All", "Transactional", "Marketing"]
    
    var body: some View {
        VStack{
            Form {
                Section(header: Text("Nuevo Registro")) {
                    VStack(alignment: .leading){
                        Text("Número").font(.headline)
                        TextField("", text: $numero, prompt: Text("Ingresa el Número"))
                            .padding(.all)
                        Text("Prototipo").font(.headline)
                        TextField("", text: $prototipo, prompt: Text("Ingresa el Prototipo"))
                            .padding(.all)
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
                            ForEach(0 ..< 3) {
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
                prototipo: prototipo,
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
