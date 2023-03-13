package com.jfsb.kuchen.core.network.models


sealed class Result<out T> {
    object Loading: Result<Nothing>()

    data class Success<out T>(
        val data: T
    ): Result<T>()

    data class Error(
        val message: String
    ): Result<Nothing>()
}