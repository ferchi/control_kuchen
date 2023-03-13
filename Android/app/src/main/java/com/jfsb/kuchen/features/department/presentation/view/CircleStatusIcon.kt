package com.jfsb.kuchen.features.department.presentation.view

import androidx.compose.foundation.background
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Favorite
import androidx.compose.material3.Icon
import androidx.compose.runtime.Composable
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import com.jfsb.kuchen.R

@Composable
fun CircleStatusIcon(
    modifier: Modifier = Modifier,
    status: String = "EN PROCESO"
) {
    Box(
        contentAlignment = Alignment.Center,
        modifier = modifier
            .size(64.dp)
            .background(getBgColor(status), shape = CircleShape)
    ) {
        Icon(
            painter = painterResource(id = R.drawable.ic_icon_kuchen_white),
            contentDescription = "Favorite icon",
            tint = Color.White
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

@Preview(name = "CircleStatusIcon")
@Composable
private fun PreviewCircleStatusIcon() {
    CircleStatusIcon()
}