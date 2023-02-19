//
//  DepViewModel.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import Foundation

final class DepViewModel: ObservableObject {
    private let depRepository: DepRepository
    @Published var deps: [Departamento] = []
    @Published var messageError: String?
    @Published var isEditing:Bool = false
    
    init(depRepository: DepRepository = DepRepository()) {
        self.depRepository = depRepository
    }
    
    func getAllDeps() {
        depRepository.getAllDeps { result in
            switch result {
            case .success(let depsModels):
                self.deps = depsModels
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
    
    func toEdit(){
        self.isEditing.toggle()
    }
    
    func createNewDep(dep:Departamento) {
        depRepository.createDep(dep: dep) { result in
            switch result {
            case .success(let dep):
                // Aplicar la lógica que quieras, mostrar un alert?
                print("✅ New Dep: \(dep.numero) added")
            case .failure(let error):
                self.messageError = error.localizedDescription
            }
        }
    }
    
    func updateEquipos(dep: Departamento) {
        let updatedDep = Departamento(
            id:dep.id,
            numero: dep.numero,
            prototipo: dep.prototipo,
            instalador: dep.instalador,
            fecha: dep.fecha,
            equipos: dep.equipos ? false : true,
            plomeria: dep.plomeria,
            estatus: dep.estatus,
            notas: dep.notas)
        depRepository.update(dep: updatedDep)
    }
    
    func updatePlomeria(dep: Departamento) {
        let updatedDep = Departamento(
            id:dep.id,
            numero: dep.numero,
            prototipo: dep.prototipo,
            instalador: dep.instalador,
            fecha: dep.fecha,
            equipos: dep.equipos,
            plomeria: dep.plomeria ? false : true,
            estatus: dep.estatus,
            notas: dep.notas)
        depRepository.update(dep: updatedDep)
    }
    
    func updateNotas(dep: Departamento, notas:String) {
        let updatedDep = Departamento(
            id:dep.id,
            numero: dep.numero,
            prototipo: dep.prototipo,
            instalador: dep.instalador,
            fecha: dep.fecha,
            equipos: dep.equipos,
            plomeria: dep.plomeria,
            estatus: dep.estatus,
            notas: notas)
        depRepository.update(dep: updatedDep)
    }
    
    func updateEstatus(dep: Departamento, estatus:String) {
        let updatedDep = Departamento(
            id:dep.id,
            numero: dep.numero,
            prototipo: dep.prototipo,
            instalador: dep.instalador,
            fecha: dep.fecha,
            equipos: dep.equipos,
            plomeria: dep.plomeria,
            estatus: estatus,
            notas: dep.notas)
        depRepository.update(dep: updatedDep)
    }
    
    func delete(dep: Departamento) {
        depRepository.delete(dep: dep)
    }
}
