package com.jfsb.kuchen.features.department.domain.repository

import com.google.firebase.firestore.CollectionReference
import com.jfsb.kuchen.core.network.models.Result
import com.jfsb.kuchen.core.Constants.DATE
import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.data.dataSource.remote.DepartmentAux
import com.jfsb.kuchen.features.department.data.repository.DepartmentRepository
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.channels.awaitClose
import kotlinx.coroutines.flow.callbackFlow
import kotlinx.coroutines.flow.flow
import kotlinx.coroutines.tasks.await
import javax.inject.Inject

@ExperimentalCoroutinesApi
class DepartmentRepositoryImpl @Inject constructor(private val depsRef: CollectionReference) :
    DepartmentRepository {

    override suspend fun getDepartments() = callbackFlow {
        val snapshotListener = depsRef.orderBy(DATE).addSnapshotListener { snapshot, e ->
            val response = if (snapshot != null) {
                val deps = snapshot.toObjects(Department::class.java)
                Result.Success(deps)
            } else {
                Result.Error(e?.message ?: e.toString())
            }
            trySend(response).isSuccess
        }
        awaitClose {
            snapshotListener.remove()
        }
    }


    override suspend fun createDepartment(departmentAux: DepartmentAux) = flow {
        try {
            emit(Result.Loading)
            val depId = depsRef.document().id
            val department = Department(
                depId,
                departmentAux.numero,
                departmentAux.prototipo,
                departmentAux.instalador,
                departmentAux.fecha,
                departmentAux.equipos,
                departmentAux.plomeria,
                departmentAux.estatus,
                departmentAux.notas
            )
            val addition = depsRef.document(depId).set(department).await()
            emit(Result.Success(addition))
        } catch (e: Exception) {
            emit(Result.Error(e.message ?: e.toString()))
        }
    }

    override suspend fun updateDepartment(department: Department) = flow {
        try {
            emit(Result.Loading)
            val addition = depsRef.document(department.id!!).set(department).await()
            emit(Result.Success(addition))
        } catch (e: Exception) {
            emit(Result.Error(e.message ?: e.toString()))
        }
    }

    override suspend fun deleteDepartment(department: Department) = flow {
        try {
            emit(Result.Loading)
            val deletion = depsRef.document(department.id!!).delete().await()
            emit(Result.Success(deletion))
        } catch (e: Exception) {
            emit(Result.Error(e.message ?: e.toString()))
        }
    }
}