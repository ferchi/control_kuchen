//
//  CheckBoxStyle.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import Foundation
import SwiftUI

struct CheckBoxStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        // 1
        Button(action: {

            // 2
            configuration.isOn.toggle()

        }, label: {
            HStack {
                // 3
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")

                configuration.label
            }
        })
    }
}
