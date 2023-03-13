package com.jfsb.kuchen.features.department.data.dataSource.remote

import com.google.firebase.firestore.DocumentId
import java.util.Date

data class Department(
    @DocumentId var id: String? = null,
    var numero: String? = null,
    var prototipo: String? = null,
    var instalador: String? = null,
    var fecha: Date? = null,
    var equipos: Boolean? = null,
    var plomeria: Boolean? = null,
    var estatus: String? = null,
    var notas: String? = null
)
