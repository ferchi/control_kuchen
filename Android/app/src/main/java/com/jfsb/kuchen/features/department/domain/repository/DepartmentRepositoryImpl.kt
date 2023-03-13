package com.jfsb.kuchen.features.department.domain.repository

import com.jfsb.kuchen.core.network.models.Result
import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.data.repository.DepartmentRepository
import kotlinx.coroutines.ExperimentalCoroutinesApi
import kotlinx.coroutines.flow.Flow
import javax.inject.Inject
import javax.inject.Singleton

@ExperimentalCoroutinesApi
class DepartmentRepositoryImpl @Inject constructor() : DepartmentRepository {
    override suspend fun getDepartments(): Flow<Result<List<Department>>> {
        TODO("Not yet implemented")
    }

    override suspend fun createDepartment(department: Department): Flow<Result<Void?>> {
        TODO("Not yet implemented")
    }

    override suspend fun updateDepartment(department: Department): Flow<Result<Void?>> {
        TODO("Not yet implemented")
    }

    override suspend fun deleteDepartment(department: Department): Flow<Result<Void?>> {
        TODO("Not yet implemented")
    }
}