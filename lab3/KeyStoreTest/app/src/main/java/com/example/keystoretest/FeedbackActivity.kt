package com.example.keystoretest

import android.annotation.SuppressLint
import android.content.Intent
import android.database.sqlite.SQLiteDatabase
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.ComponentActivity


class FeedbackActivity : ComponentActivity() {
    private var mDB: SQLiteDatabase? = null
    @SuppressLint("SetTextI18n")
    override fun onCreate(savedInstanceState: Bundle?) {
        setContentView(R.layout.tertiary)
        try {
            this.mDB = openOrCreateDatabase("feedback_db", 0, null)
            this.mDB?.execSQL("CREATE TABLE IF NOT EXISTS feedback_table(user_feedback VARCHAR);")
        } catch (e: Exception) {
            Log.d("Diva", "Error occurred while creating database: " + e.message)
        }

        super.onCreate(savedInstanceState)
        val backButton: Button = findViewById(R.id.FeedbackActivityBackButton)
        backButton.setOnClickListener {
            val myIntent: Intent = Intent(this, ApiActivity::class.java)
            startActivity(myIntent)
        }

        val sendFeedbackButton: Button = findViewById(R.id.FeedbackActivitySendButton)

        sendFeedbackButton.setOnClickListener {
            saveFeedback()
        }

    }

    private fun saveFeedback() {
        val feedbackEditText: EditText = findViewById(R.id.FeedbackEditTextView)
        try {
            mDB!!.execSQL("INSERT INTO feedback_table VALUES ('" + feedbackEditText.text.toString() + "');")
            mDB!!.close()
        } catch (e: Exception) {
            Log.d("Diva", "Error occurred while inserting into database: " + e.message)
        }
        Toast.makeText(this, "Feedback was saved!", Toast.LENGTH_SHORT).show()
    }
}