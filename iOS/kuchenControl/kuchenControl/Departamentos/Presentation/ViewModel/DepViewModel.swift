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
}
