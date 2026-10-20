// Import will depend on App ID.
package com.mydomain.homescreen_widgets

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.widget.RemoteViews

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import java.io.File

import android.net.Uri
import es.antonborri.home_widget.HomeWidgetLaunchIntent

import es.antonborri.home_widget.HomeWidgetPlugin


/**
 * Implementation of App Widget functionality.
 */
class NewsWidget : AppWidgetProvider() {
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        for (appWidgetId in appWidgetIds) {
            // Get reference to SharedPreferences
            val widgetData = HomeWidgetPlugin.getData(context)
            val views = RemoteViews(context.packageName, R.layout.news_widget).apply {
                val title = widgetData.getString("headline_title", null)
                setTextViewText(R.id.headline_title, title ?: "No title set")

                val description = widgetData.getString("headline_description", null)
                if (description != null) {
                    setTextViewText(R.id.headline_description, description)
                }

                val imageName = widgetData.getString("filename", null)
                if (imageName != null) {
                    val imageFile = File(imageName)
                    val imageExists = imageFile.exists()
                    if (imageExists) {
                        val myBitmap: Bitmap = BitmapFactory.decodeFile(imageFile.absolutePath)
                        setImageViewBitmap(R.id.widget_image, myBitmap)
                    } else {
                        println("debug hero: image not found!, looked @: ${imageName}")
                    }
                } else {
                    println("debug hero: image not set")
                }
            }

            appWidgetManager.updateAppWidget(appWidgetId, views)
        }
    }
}