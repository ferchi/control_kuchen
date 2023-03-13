package com.jfsb.kuchen.core.navigation

import androidx.compose.runtime.Composable
import androidx.compose.runtime.InternalComposeApi
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.jfsb.kuchen.features.department.presentation.screen.ListScreen
import com.jfsb.kuchen.features.department.presentation.viewmodel.DepartmentViewModel

@OptIn(InternalComposeApi::class)
@Composable
fun NavGraph(
    navHostController: NavHostController,
    departmentViewModel: DepartmentViewModel
) {
    NavHost(
        navController = rememberNavController(),
        startDestination = Routes.List.route
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