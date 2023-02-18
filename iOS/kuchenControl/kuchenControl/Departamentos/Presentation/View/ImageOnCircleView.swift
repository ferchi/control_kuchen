//
//  ImageOnCircleView.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 18/02/23.
//

import SwiftUI


struct ImageOnCircleView: View {
    
    let icon: String
    let radius: CGFloat
    let circleColor: Color
//    let imageColor: Color // Remove this for an image in your assets folder.
    var squareSide: CGFloat {
        2.0.squareRoot() * radius
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(circleColor)
                .frame(width: radius * 2, height: radius * 2)
            
            // Use this implementation for an SF Symbol
//            Image(systemName: icon)
//                .resizable()
//                .aspectRatio(1.0, contentMode: .fit)
//                .frame(width: squareSide, height: squareSide)
//                .foregroundColor(imageColor)
            
            // Use this implementation for an image in your assets folder.
            Image(icon)
                .resizable()
                .aspectRatio(1.0, contentMode: .fit)
                .frame(width: squareSide, height: squareSide)
        }
    }
}

