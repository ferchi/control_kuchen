package com.jfsb.kuchen.features.department.presentation.view

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.*
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.text.style.TextAlign
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Composable
fun HeaderView() {
    Row(
        modifier = Modifier.fillMaxWidth().height(100.dp),
        horizontalArrangement = Arrangement.SpaceEvenly,
        verticalAlignment = Alignment.CenterVertically
    ) {
        StatusView(estatus = "EN PROCESO")
        StatusView(estatus = "TERMINADO")
        StatusView(estatus = "ESTIMADO")
        StatusView(estatus = "ENTREGADO")
    }
}

@Composable
fun StatusView(estatus: String) {
    Column(
        horizontalAlignment = Alignment.CenterHorizontally
    ) {
        Box(
            modifier = Modifier
                .size(width = 50.dp, height = 10.dp)
                .background(getBgColor(status = estatus)),
            contentAlignment = Alignment.Center
        ) {
// Empty box, just for the background and shadow
        }
        Text(
            text = estatus,
            fontSize = 14.sp,
            fontWeight = FontWeight.Normal,
            textAlign = TextAlign.Center
        )
    }
}

private fun getBgColor(status: String): Color {
    return when (status) {
        "EN PROCESO" -> Color(0xFFE7AD1B)
        "TERMINADO" -> Color(0xFF128812)
        "ESTIMADO" -> Color(0xFFF600FF)
        "ENTREGADO" -> Color(0xFFF80707)
        else -> Color(0xFFE7AD1B)
    }
}

@Preview(name = "HeaderView")
@Composable
private fun PreviewHeaderView() {
    HeaderView()
}