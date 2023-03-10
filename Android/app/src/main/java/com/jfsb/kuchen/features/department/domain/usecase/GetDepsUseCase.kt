package com.jfsb.kuchen.features.department.domain.usecase

import com.jfsb.kuchen.features.department.domain.repository.DepartmentRepositoryImpl
import kotlinx.coroutines.ExperimentalCoroutinesApi
import javax.inject.Inject

class GetDepsUseCase @Inject constructor (private val repo: DepartmentRepositoryImpl) {
    @OptIn(ExperimentalCoroutinesApi::class)
    suspend operator fun invoke() = repo.getDepartments()
}