package com.jfsb.kuchen.features.department.data.dataSource.remote


import java.util.*

data class DepartmentAux(
    val numero: String,
    val prototipo: String,
    val instalador: String,
    val fecha: Date,
    val equipos: Boolean,
    val plomeria: Boolean,
    val estatus: String,
    val notas: String
)
