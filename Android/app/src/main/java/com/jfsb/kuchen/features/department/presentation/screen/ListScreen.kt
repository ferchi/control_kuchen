package com.jfsb.kuchen.features.department.presentation.screen

import androidx.compose.foundation.layout.*
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Scaffold
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.InternalComposeApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import androidx.navigation.compose.rememberNavController
import com.jfsb.kuchen.features.department.presentation.viewmodel.DepartmentViewModel

@OptIn(ExperimentalMaterial3Api::class, InternalComposeApi::class)
@Composable
fun ListScreen(
    modifier: Modifier = Modifier,
    navHostController: NavHostController,
    departmentViewModel: DepartmentViewModel
) {
    Scaffold(
        modifier = modifier,
        topBar = {
            Row(
                modifier = Modifier
                    .padding(16.dp)
                    .fillMaxWidth()
                    .height(56.dp),
            ) {
                Text(
                    modifier = Modifier.fillMaxWidth(),
                    text = "Lista de control",
                    style = MaterialTheme.typography.titleLarge.copy(
                        textAlign = TextAlign.Center,
                        fontWeight = FontWeight.Bold
                    )
                )
            }
        },
    ) {
        Column(modifier = Modifier.padding(paddingValues = it)) {

        }
    }
}

@OptIn(InternalComposeApi::class)
@Preview(name = "ListScreen")
@Composable
private fun PreviewListScreen() {
    ListScreen(
        modifier = Modifier,
        navHostController = rememberNavController(),
        departmentViewModel = DepartmentViewModel()
    )
}