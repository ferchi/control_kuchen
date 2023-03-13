package com.jfsb.kuchen.features.department.presentation.viewmodel

import androidx.compose.runtime.InternalComposeApi
import androidx.compose.runtime.State
import androidx.compose.runtime.mutableStateOf
import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import com.jfsb.kuchen.features.department.domain.usecase.CreateDepUseCase
import com.jfsb.kuchen.features.department.domain.usecase.DeleteDepUseCase
import com.jfsb.kuchen.features.department.domain.usecase.GetDepsUseCase
import com.jfsb.kuchen.features.department.domain.usecase.UpdateDepUseCase
import dagger.hilt.android.lifecycle.HiltViewModel
import com.jfsb.kuchen.core.network.models.Result
import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.data.dataSource.remote.DepartmentAux
import kotlinx.coroutines.launch
import javax.inject.Inject

@HiltViewModel
@InternalComposeApi
class DepartmentViewModel @Inject constructor(
    private val createDepUseCase: CreateDepUseCase,
    private val getDepUseCase: GetDepsUseCase,
    private val updateDepUseCase: UpdateDepUseCase,
    private val deleteDepUseCase: DeleteDepUseCase,
) : ViewModel() {
    private val _depsListState = mutableStateOf<Result<List<Department>>>(Result.Loading)
    val depsListState: State<Result<List<Department>>> = _depsListState

    private val _isDepAddedState = mutableStateOf<Result<Void?>>(Result.Success(null))
    val isDepAddedState: State<Result<Void?>> = _isDepAddedState
    var openDialogState = mutableStateOf(false)

    private val _isDepUpdatedState = mutableStateOf<Result<Void?>>(Result.Success(null))
    val isDepUpdatedState: State<Result<Void?>> = _isDepUpdatedState

    private val _isDepDeletedState = mutableStateOf<Result<Void?>>(Result.Success(null))
    val isDepDeletedState: State<Result<Void?>> = _isDepDeletedState

    init {
        getDepsList()
    }

    private fun getDepsList() {
        viewModelScope.launch {
            getDepUseCase.invoke().collect { response ->
                _depsListState.value = response
            }
        }
    }

    fun createDep(department: DepartmentAux) {
        viewModelScope.launch {
            createDepUseCase.invoke(department).collect { response ->
                _isDepAddedState.value = response
            }
        }
    }

    fun updateDep(department: Department) {
        viewModelScope.launch {
            updateDepUseCase.invoke(department).collect { response ->
                _isDepUpdatedState.value = response
            }
        }
    }

    fun deleteDep(department: Department) {
        viewModelScope.launch {
            deleteDepUseCase.invoke(department).collect { response ->
                _isDepDeletedState.value = response
            }
        }
    }
}