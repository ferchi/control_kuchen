package com.jfsb.kuchen

import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.viewModels
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.ui.Modifier
import androidx.navigation.compose.rememberNavController
import com.jfsb.kuchen.core.navigation.NavGraph
import com.jfsb.kuchen.features.department.presentation.viewmodel.DepartmentViewModel
import com.jfsb.kuchen.ui.theme.KuchenTheme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            KuchenTheme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    val navController = rememberNavController()
                    val departmentViewModel: DepartmentViewModel by viewModels()

                    NavGraph(navHostController = navController, departmentViewModel = departmentViewModel)
                }
            }
        }
    }
}