package com.jfsb.kuchen.features.department.presentation.view

import androidx.compose.foundation.layout.*
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.*
import androidx.compose.material3.*
import androidx.compose.runtime.Composable
import androidx.compose.runtime.InternalComposeApi
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.text.style.TextOverflow
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.jfsb.kuchen.R
import com.jfsb.kuchen.features.department.data.dataSource.remote.Department
import com.jfsb.kuchen.features.department.presentation.viewmodel.DepartmentViewModel
import java.text.SimpleDateFormat
import java.util.*

@OptIn(ExperimentalMaterial3Api::class, InternalComposeApi::class)
@Composable
fun DepCardView(
    modifier: Modifier = Modifier,
    dep: Department,
    departmentViewModel: DepartmentViewModel
) {
    Card(
        modifier = modifier,
        elevation = CardDefaults.cardElevation(4.dp),
        colors = CardDefaults.cardColors(
            containerColor = Color.White
        ),
        onClick = {

        }
    ) {
        Box(
            modifier = Modifier
                .fillMaxWidth()
                .height(80.dp),
        ) {
            Row {
                CircleStatusIcon(modifier = Modifier.padding(8.dp), status = dep.estatus!!)
                Column(
                    modifier = Modifier
                        .padding(16.dp)
                        .width(100.dp)
                ) {
                    Text(
                        modifier = Modifier.fillMaxWidth(),
                        text = "Num: ${dep.numero!!}",
                        style = MaterialTheme.typography.bodyMedium.copy(
                            fontWeight = FontWeight.Bold,
                            textAlign = TextAlign.Center
                        ),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    Text(
                        modifier = Modifier.fillMaxWidth(),
                        text = dep.prototipo!!,
                        style = MaterialTheme.typography.bodySmall.copy(
                            textAlign = TextAlign.Center
                        ),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                }
                Column(
                    modifier = Modifier
                        .padding(16.dp)
                        .width(100.dp)
                ) {
                    val dateFormat = SimpleDateFormat("dd/MM/yyyy")
                    val dateFormatted = dateFormat.format(dep.fecha!!)
                    Text(
                        modifier = Modifier.fillMaxWidth(),
                        text = dateFormatted,
                        style = MaterialTheme.typography.bodySmall.copy(
                            fontWeight = FontWeight.Thin,
                            textAlign = TextAlign.Center
                        ),
                        maxLines = 1,
                        overflow = TextOverflow.Ellipsis
                    )
                    Row {
                        IconButton(onClick = {
                            departmentViewModel.updateDep(dep.copy(equipos = !dep.equipos!!))
                        }) {
                            Icon(
                                modifier = Modifier.size(24.dp),
                                painter = painterResource(id = R.drawable.ic_equipment),
                                tint = if (dep.equipos!!) Color.Blue else Color.LightGray,
                                contentDescription = "Equipment"
                            )
                        }
                        IconButton(onClick = {
                            departmentViewModel.updateDep(dep.copy(plomeria = !dep.plomeria!!))
                        }) {
                            Icon(
                                modifier = Modifier.size(24.dp),
                                painter = painterResource(id = R.drawable.ic_plumbing),
                                tint = if (dep.plomeria!!) Color.Blue else Color.LightGray,
                                contentDescription = "Plumbing"
                            )
                        }
                    }
                }
            }
        }
    }
}
