package com.jfsb.kuchen.core.di

import com.google.firebase.firestore.CollectionReference
import com.google.firebase.firestore.ktx.firestore
import com.google.firebase.ktx.Firebase
import com.jfsb.kuchen.core.Constants.DEPS
import com.jfsb.kuchen.features.department.data.repository.DepartmentRepository
import com.jfsb.kuchen.features.department.domain.repository.DepartmentRepositoryImpl
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent

@Module
@InstallIn(SingletonComponent::class)
object RemoteModule {
    @Provides
    fun provideDepsRef() = Firebase.firestore.collection(DEPS)

    @Provides
    fun provideDepsRepository(
        depsRef: CollectionReference
    ): DepartmentRepository = DepartmentRepositoryImpl(depsRef)
}