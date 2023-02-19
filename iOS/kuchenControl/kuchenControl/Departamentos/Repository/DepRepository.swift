//
//  DepRepository.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import Foundation


final class DepRepository {
    private let depDatasource: DepDatasource
    
    init(depDatasource: DepDatasource = DepDatasource()) {
        self.depDatasource = depDatasource
    }
    
    func getAllDeps(completionBlock: @escaping (Result<[Departamento], Error>) -> Void) {
        self.depDatasource.getAllDeps(completionBlock: completionBlock)
    }
    
    func createDep(dep: Departamento,completionBlock: @escaping (Result<Departamento, Error>) -> Void) {
        self.depDatasource.createNew(dep: dep,completionBlock: completionBlock)
    }
    func update(dep: Departamento) {
        print("DepRepository")

        self.depDatasource.update(dep: dep)
    }
    func delete(dep: Departamento) {
        self.depDatasource.delete(dep: dep)
    }
}
