package com.jfsb.kuchen.features.department.presentation.screen

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Add
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.InternalComposeApi
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.unit.dp
import androidx.navigation.NavHostController
import com.jfsb.kuchen.core.network.models.Result
import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.presentation.view.DepCardView
import com.jfsb.kuchen.features.department.presentation.view.HeaderView
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
        floatingActionButton = {
            FloatingActionButton(
                onClick = {
                    navHostController.navigate("add")
                },
                modifier = Modifier.padding(8.dp),
                containerColor = Color(0xFFE7AD1B),
            ) {
                Icon(
                    imageVector = Icons.Default.Add,
                    contentDescription = "Add",
                    tint = Color.White
                )
            }
        },
    ) {
        Column(modifier = Modifier.padding(paddingValues = it)) {
            HeaderView()
            when (val state = departmentViewModel.depsListState.value) {
                is Result.Loading -> {
                    Box(modifier = Modifier.fillMaxSize()) {
                        CircularProgressIndicator(modifier = Modifier.align(Alignment.Center))
                    }
                }
                is Result.Success<*> -> {
                    LazyColumn {
                        items((state.data as List<*>).size) { index ->
                            DepCardView(
                                modifier = Modifier.padding(
                                    horizontal = 16.dp,
                                    vertical = 4.dp
                                ),
                                dep = (state.data as List<Department>)[index],
                                departmentViewModel = departmentViewModel
                            )
                        }
                    }
                }
                is Result.Error -> {
                    Text(text = "Error")
                }
            }
        }
    }
}