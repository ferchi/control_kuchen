package com.jfsb.kuchen.core.di

import android.app.Application
import android.app.NotificationChannel
import android.app.NotificationManager
import android.os.Build
import com.jfsb.kuchen.R
import dagger.hilt.android.HiltAndroidApp

@HiltAndroidApp
class KuchenApp: Application() {
    private val id = "Kuchen"

    override fun onCreate() {
        super.onCreate()
        createNotificationChannels()
    }

    private fun createNotificationChannels() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(id, "Kuchen", NotificationManager.IMPORTANCE_HIGH )
            channel.description = getString(R.string.app_describe)
            val manager = getSystemService(NotificationManager::class.java)
            manager.createNotificationChannel(channel)
        }
    }
}