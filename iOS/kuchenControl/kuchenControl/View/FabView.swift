//
//  FabView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 07/02/23.
//

import Foundation
import SwiftUI

struct FabView: View {
    var body: some View {
        HStack {
            Spacer()
            
            Button(action: {
                //Place your action here
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .padding(8)
            }
            .background(.purple)
            .foregroundColor(.white)
            .cornerRadius(.infinity)
            .padding()
            
        }
    }
}
