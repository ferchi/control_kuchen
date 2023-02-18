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
        HStack{
            VStack{
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(getBackgroundColor(estatus:"EN PROCESO")).shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    ).frame(width: 50, height: 10)
                Text("EN PROCESO").font(.footnote)
            }
            VStack{
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(getBackgroundColor(estatus:"TERMINADO")).shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    ).frame(width: 50, height: 10)
                Text("TERMINADO").font(.footnote)
            }
            VStack{
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(getBackgroundColor(estatus:"ESTIMADO")).shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    ).frame(width: 50, height: 10)
                Text("ESTIMADO").font(.footnote)
            }
            VStack{
                RoundedRectangle(cornerRadius: 80, style: .continuous)
                    .fill(getBackgroundColor(estatus:"ENTREGADO")).shadow(
                        color: Color.gray.opacity(0.7),
                        radius: 8,
                        x: 0,
                        y: 0
                    ).frame(width: 50, height: 10)
                Text("ENTREGADO").font(.footnote)
            }
        }.frame(width: .infinity, height: 100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
