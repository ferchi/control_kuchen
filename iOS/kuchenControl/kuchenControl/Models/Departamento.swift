//
//  Departamento.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 06/02/23.
//

import Foundation
import SwiftUI

struct Departamento:Identifiable{
    var id:Int
    var numero:String
    var prototipo:String
    var instalador:String
    var fecha:Date
    @Binding var equipos:Bool
    @Binding var plomeria:Bool
    var estatus:String
    var notas:String
}

extension Departamento{
    static let sampleData: [Departamento] =
    [
        Departamento(id: 1, numero: "23/1", prototipo: "3/R", instalador: "Juan Perez Dominguez", fecha: Date(), equipos: .constant(true), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas"),
        Departamento(id: 2, numero: "23/2", prototipo: "2/R", instalador: "Pedro Paramo", fecha: Date(), equipos: .constant(true), plomeria: .constant(true), estatus: "FINALIZADO", notas: "Notas bien hechas"),
        Departamento(id: 3, numero: "25/1", prototipo: "2/R", instalador: "Fernando Salinas", fecha: Date(), equipos: .constant(false), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas, largas para probar el overflow"),
        Departamento(id: 1, numero: "23/1", prototipo: "3/R", instalador: "Juan Perez Dominguez", fecha: Date(), equipos: .constant(true), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas"),
        Departamento(id: 2, numero: "23/2", prototipo: "2/R", instalador: "Pedro Paramo", fecha: Date(), equipos: .constant(true), plomeria: .constant(true), estatus: "FINALIZADO", notas: "Notas bien hechas"),
        Departamento(id: 3, numero: "25/1", prototipo: "2/R", instalador: "Fernando Salinas", fecha: Date(), equipos: .constant(false), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas, largas para probar el overflow"),
        Departamento(id: 1, numero: "23/1", prototipo: "3/R", instalador: "Juan Perez Dominguez", fecha: Date(), equipos: .constant(true), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas"),
        Departamento(id: 2, numero: "23/2", prototipo: "2/R", instalador: "Pedro Paramo", fecha: Date(), equipos: .constant(true), plomeria: .constant(true), estatus: "FINALIZADO", notas: "Notas bien hechas"),
        Departamento(id: 3, numero: "25/1", prototipo: "2/R", instalador: "Fernando Salinas", fecha: Date(), equipos: .constant(false), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas, largas para probar el overflow"),
        Departamento(id: 1, numero: "23/1", prototipo: "3/R", instalador: "Juan Perez Dominguez", fecha: Date(), equipos: .constant(true), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas"),
        Departamento(id: 2, numero: "23/2", prototipo: "2/R", instalador: "Pedro Paramo", fecha: Date(), equipos: .constant(true), plomeria: .constant(true), estatus: "FINALIZADO", notas: "Notas bien hechas"),
        Departamento(id: 3, numero: "25/1", prototipo: "2/R", instalador: "Fernando Salinas", fecha: Date(), equipos: .constant(false), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas, largas para probar el overflow"),
        Departamento(id: 1, numero: "23/1", prototipo: "3/R", instalador: "Juan Perez Dominguez", fecha: Date(), equipos: .constant(true), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas"),
        Departamento(id: 2, numero: "23/2", prototipo: "2/R", instalador: "Pedro Paramo", fecha: Date(), equipos: .constant(true), plomeria: .constant(true), estatus: "FINALIZADO", notas: "Notas bien hechas"),
        Departamento(id: 3, numero: "25/1", prototipo: "2/R", instalador: "Fernando Salinas", fecha: Date(), equipos: .constant(false), plomeria: .constant(false), estatus: "EN PROCESO", notas: "Notas bien hechas, largas para probar el overflow")
    ]
}
