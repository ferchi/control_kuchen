//
//  RowView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import SwiftUI

struct ListContentView: View {
    @ObservedObject var depViewModel: DepViewModel
    let estatusOptions = ["EN PROCESO", "TERMINADO", "ESTIMADO", "ENTREGADO"]
    @State private var selection = ""

    var body: some View {
        
        List {
            ForEach(depViewModel.deps) { dep in
                let format = dep.fecha.formatted(date: .abbreviated, time: .omitted)
                
                
                NavigationLink(destination: DepDetailsScreen(dep: dep)){ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(.white).shadow(
                            color: Color.gray.opacity(0.7),
                            radius: 8,
                            x: 0,
                            y: 0
                        )
                    HStack(){
                        ImageOnCircleView(icon: "KuchenWhiteIcon", radius: 30, circleColor: getBackgroundColor(estatus: dep.estatus)).padding(8)
                        VStack{
                            HStack{
                                VStack{
                                    Text("Núm: \(dep.numero)").frame(width: 100).foregroundColor(Color.black).font(.headline)
                                    Text("(\(dep.prototipo))").frame(width: 100).foregroundColor(Color.gray).font(.footnote)
                                }
                                Spacer(minLength: 10)
                                VStack{
                                    Text(format).frame(width: 100).font(.footnote).foregroundColor(.gray)
                                    HStack{
                                        if(dep.equipos){Image(systemName: "stove.fill").frame(width: 100).foregroundColor(.blue)}
                                        else{Image(systemName: "stove").frame(width: 100)}
                                        if(dep.plomeria){Image(systemName: "spigot.fill").frame(width: 100).foregroundColor(.blue)}
                                        else{Image(systemName: "spigot").frame(width: 100)}
                                    }
                                }
                            }
                        }
                        //                    Text(dep.instalador).frame(width: 150).lineLimit(1).foregroundColor(Color.white)
                        //                    Text(dep.estatus).frame(width: 150).lineLimit(1).foregroundColor(Color.white)
                        //                    Text(dep.notas).lineLimit(1).frame(width: 150, height: 50).lineLimit(1).foregroundColor(Color.white)
                    }
                }}.frame(width: .infinity, height: 60).padding([.vertical], 8).swipeActions(edge: .trailing) {
                    Button(action: {
                        depViewModel.updateEstatus(dep: dep, estatus: estatusOptions[
                            changeStatus(estatus: dep.estatus, action: 1)]
                        )
                    }, label: {
                        Image(systemName: "arrow.forward.square").frame(width: 100)
                    })
                    .tint(.green)
                    Button(action: {
                        depViewModel.updatePlomeria(dep: dep)
                    }, label: {
                        if(dep.plomeria){Image(systemName: "spigot.fill").frame(width: 100).foregroundColor(.blue)}
                        else{Image(systemName: "spigot").frame(width: 100)}
                    })
                    .tint(.blue)
                    Button(action: {
                        depViewModel.updateEquipos(dep: dep)
                    }, label: {
                        if(dep.equipos){Image(systemName: "stove.fill").frame(width: 100).foregroundColor(.blue)}
                        else{Image(systemName: "stove").frame(width: 100)}
                        
                    })
                    .tint(.purple)
                }.swipeActions(edge: .leading) {
                    Button(action: {
                        depViewModel.updateEstatus(dep: dep, estatus: estatusOptions[
                            changeStatus(estatus: dep.estatus, action: -1)]
                        )
                    }, label: {
                        Image(systemName: "arrow.backward.square").frame(width: 100)
                    })
                    .tint(.green)
                    Button(action: {
                        depViewModel.delete(dep: dep)
                    }, label: {
                        Image(systemName: "minus.circle.fill").frame(width: 100)
                    })
                    .tint(.red)
                }
            }}.listStyle(.plain)
            .task {
                depViewModel.getAllDeps()
            }
//            .refreshable {
//                depViewModel.getAllDeps()
//            }
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        let depViewModel = DepViewModel()
        ListContentView(depViewModel: depViewModel)
    }
}

func changeStatus(estatus:String, action: Int) -> Int{
    var index = 0
    switch estatus {
    case "EN PROCESO":
        index = 0 + action
        
    case "TERMINADO":
        index = 1 + action
        
    case "ESTIMADO":
        index = 2 + action
        
    case "ENTREGADO":
        index = 3 + action
        
    default:
        index = 0
    }
    if(index<0) {return 0}
    else if(index > 3){return 3}
    else {return index}
}
