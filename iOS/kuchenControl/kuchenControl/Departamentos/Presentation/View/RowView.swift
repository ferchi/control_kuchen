//
//  RowView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 18/02/23.
//

import SwiftUI

struct RowView: View {
    @State var dep:Departamento
    
    var body: some View {
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
        }}.frame(width: .infinity, height: 60).padding([.vertical], 8)
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        let dep = Departamento(numero: "21", prototipo: "2R", instalador: "Juan Fernando Salinas", fecha: Date(), equipos: true, plomeria: false, estatus: "EN PROCESO", notas: "lorem upsium nujmijna huanhujnm ahujmaijbg hgabhnjmk gbahnjimk yagbhnjmagbhnujmi abnhjm abhn abynm")
        RowView(dep: dep)
    }
}

func getBackgroundColor(estatus:String) -> Color{
    switch estatus {
    case "EN PROCESO":
        return Color.green
        
    case "TERMINADO":
        return Color.blue
        
    case "ESTIMADO":
        return Color.purple
        
    case "ENTREGADO":
        return Color.pink
        
    default:
        return Color.white
    }
}
