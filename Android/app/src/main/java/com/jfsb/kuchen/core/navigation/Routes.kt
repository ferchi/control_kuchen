package com.jfsb.kuchen.core.navigation

sealed class Routes(val route: String) {
    object Splash : Routes("Splash")
    object List : Routes("List")
    object Detail : Routes("Detail")
    object Create : Routes("Create")
}