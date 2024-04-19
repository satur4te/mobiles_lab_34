package com.example.keystoretest

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.text.method.ScrollingMovementMethod
import android.widget.Button
import android.widget.TextView
import androidx.activity.ComponentActivity


class MainActivity : ComponentActivity() {
    @SuppressLint("SetTextI18n")
    override fun onCreate(savedInstanceState: Bundle?) {
        setContentView(R.layout.main)
        super.onCreate(savedInstanceState)
        val text: TextView = findViewById(R.id.MainActivityTextViewInfo)
        text.movementMethod = ScrollingMovementMethod()
        text.text = "ФИО: Абрамов Иван Андреевич"
        val nextButton: Button = findViewById(R.id.MainActivityNextButton)

        nextButton.setOnClickListener {
            val myIntent: Intent = Intent(this, ApiActivity::class.java)
            startActivity(myIntent)
            }
        }
    }