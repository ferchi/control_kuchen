package com.jfsb.kuchen.features.department.data.dataSource.remote

import com.google.firebase.firestore.DocumentId
import com.google.type.Date
import javax.inject.Named

data class Department(
    @DocumentId var id: String?,
    @Named("numero") val number: String,
    @Named("prototipo") val prototype: String,
    @Named("instalador") val installer: String,
    @Named("fecha") val date: Date,
    @Named("equipos") val equipment: Boolean,
    @Named("plomeria") val plomeria: Boolean,
    @Named("estatus") val status: String,
    @Named("notas") val notes: String
)
