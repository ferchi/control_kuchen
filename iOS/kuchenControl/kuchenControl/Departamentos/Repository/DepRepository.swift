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
}
