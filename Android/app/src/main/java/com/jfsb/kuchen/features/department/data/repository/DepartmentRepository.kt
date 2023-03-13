package com.jfsb.kuchen.features.department.data.repository

import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.core.network.models.Result
import com.jfsb.kuchen.features.department.data.dataSource.remote.DepartmentAux
import kotlinx.coroutines.flow.Flow

interface DepartmentRepository {
    suspend fun getDepartments(): Flow<Result<List<Department>>>
    suspend fun createDepartment(departmentAux: DepartmentAux): Flow<Result<Void?>>
    suspend fun updateDepartment(department: Department): Flow<Result<Void?>>
    suspend fun deleteDepartment(department: Department): Flow<Result<Void?>>
}