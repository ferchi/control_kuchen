//
//  Departamento.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import Foundation
import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Departamento:Decodable, Encodable, Identifiable{
    @DocumentID var id: String?
    let numero:String
    let prototipo:String
    let instalador:String
    let fecha:Date
    let equipos:Bool
    let plomeria:Bool
    let estatus:String
    let notas:String
}
