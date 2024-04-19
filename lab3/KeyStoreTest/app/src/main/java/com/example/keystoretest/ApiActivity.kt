package com.example.keystoretest

import ApiCall
import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.text.method.ScrollingMovementMethod
import android.widget.Button
import android.widget.TextView
import androidx.activity.ComponentActivity

class ApiActivity : ComponentActivity() {
    @SuppressLint("SetTextI18n")
    override fun onCreate(savedInstanceState: Bundle?) {
        setContentView(R.layout.secondary)
        super.onCreate(savedInstanceState)
        val button: Button = findViewById(R.id.ApiActivityButtonREST)
        val text: TextView = findViewById(R.id.ApiActivityTextViewREST)
        text.movementMethod = ScrollingMovementMethod()

        val nextButton: Button = findViewById(R.id.ApiActivityNextButton)
        val backButton: Button = findViewById(R.id.ApiActivityBackButton)

        nextButton.setOnClickListener {
            val myIntent: Intent = Intent(this, FeedbackActivity::class.java)
            startActivity(myIntent)
        }

        backButton.setOnClickListener {
            val myIntent: Intent = Intent(this, MainActivity::class.java)
            startActivity(myIntent)
        }
        button.setOnClickListener {
            ApiCall().getjokes(this) { repos ->
                text.text = repos.value
            }
        }


    }
}