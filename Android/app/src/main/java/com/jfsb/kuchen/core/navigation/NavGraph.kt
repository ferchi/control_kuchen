package com.jfsb.kuchen.core.navigation

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.jfsb.kuchen.features.department.presentation.screen.ListScreen
import com.jfsb.kuchen.features.department.presentation.viewmodel.DepartmentViewModel

@Composable
fun NavGraph(
    navHostController: NavHostController,
    departmentViewModel: DepartmentViewModel
) {
    NavHost(
        navController = rememberNavController(),
        route = Routes.Splash.route,
        startDestination = Routes.Splash.route
    ) {
        composable(Routes.List.route) {
            ListScreen(
                navHostController = navHostController,
                departmentViewModel = departmentViewModel
            )
        }
        composable(Routes.Splash.route) {}
        composable(Routes.Detail.route) {}
        composable(Routes.Create.route) {}
    }
}