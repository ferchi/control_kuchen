package com.jfsb.kuchen.features.department.domain.usecase

import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.domain.repository.DepartmentRepositoryImpl
import kotlinx.coroutines.ExperimentalCoroutinesApi
import javax.inject.Inject

class UpdateDepUseCase @OptIn(ExperimentalCoroutinesApi::class)
@Inject constructor(private val repo: DepartmentRepositoryImpl) {
    @OptIn(ExperimentalCoroutinesApi::class)
    suspend operator fun invoke(department:Department) = repo.updateDepartment(department)
}