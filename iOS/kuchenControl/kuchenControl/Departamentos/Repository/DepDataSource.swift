//
//  DataSource.swift
//  kuchenControl
//
//  Created by Fernando Salinas on 17/02/23.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

final class DepDatasource {
    private let database = Firestore.firestore()
    private let collection = "Departamentos"
    
    func getAllDeps(completionBlock: @escaping (Result<[Departamento], Error>) -> Void) {
        database.collection(collection)
            .addSnapshotListener { query, error in
                if let error = error {
                    print("Error retrieving all links \(error.localizedDescription)")
                    completionBlock(.failure(error))
                    return
                }
                guard let documents = query?.documents.compactMap({ $0 }) else {
                    completionBlock(.success([]))
                    return
                }
                let links = documents.map { try? $0.data(as: Departamento.self) }
                                     .compactMap { $0 }
                completionBlock(.success(links))
            }
    }
    
    func createNew(dep: Departamento, completionBlock: @escaping (Result<Departamento, Error>) -> Void) {
        do {
            _ = try database.collection(collection).addDocument(from: dep)
            completionBlock(.success(dep))
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    func update(dep: Departamento) {
        print("DepDatasource")
        guard let documentId = dep.id else {
            return
        }
        do {
            print("DepDatasource 2")
            _ = try database.collection(collection).document(documentId).setData(from: dep)            
        } catch {
            print("Error updating is favorited in database")
        }
    }
    
    func delete(dep: Departamento) {
        guard let documentId = dep.id else {
            return
        }
        database.collection(collection).document(documentId).delete()
    }
}
