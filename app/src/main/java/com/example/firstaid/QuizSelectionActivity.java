package com.example.firstaid;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;

public class QuizSelectionActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz_selection);

        Button btnStart = findViewById(R.id.btnStartQuiz);
        android.widget.TextView txtHighScore = findViewById(R.id.txtHighScore);

        android.content.SharedPreferences prefs = getSharedPreferences("FirstAidPrefs", MODE_PRIVATE);
        int highScore = prefs.getInt("high_score", 0);
        txtHighScore.setText("High Score: " + highScore);

        btnStart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(QuizSelectionActivity.this, QuizActivity.class));
                finish(); // Close selection screen so back button goes to Main
            }
        });
    }
}
