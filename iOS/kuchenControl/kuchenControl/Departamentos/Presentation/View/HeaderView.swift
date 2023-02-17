//
//  HeaderView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 07/02/23.
//

import Foundation

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ScrollView(.horizontal){
            HStack{
                Text("# Dep").frame(width: 50)
                Text("Proto").frame(width: 50)
                Text("Instalador").frame(width: 150)
                Text("Fecha").frame(width: 100)
                Text("Equip").frame(width: 50)
                Text("Plom").frame(width: 50)
                Text("Estatus").frame(width: 150)
                Text("Notas").lineLimit(1).frame(width: 150, height: 50)
            }.frame(width: 800).padding([.trailing], 50)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
