package com.example.firstaid;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;

public class ResultActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        TextView txtScore = findViewById(R.id.txtScore);
        TextView txtFeedback = findViewById(R.id.txtFeedback);
        ImageView imgBadge = findViewById(R.id.imgBadge);
        Button btnRestart = findViewById(R.id.btnRestart);
        Button btnHome = findViewById(R.id.btnHome);

        int score = getIntent().getIntExtra("SCORE", 0);
        int total = getIntent().getIntExtra("TOTAL", 0);

        txtScore.setText("Score: " + score + "/" + total);

        // High Score
        android.content.SharedPreferences prefs = getSharedPreferences("FirstAidPrefs", MODE_PRIVATE);
        int highScore = prefs.getInt("high_score", 0);
        if (score > highScore) {
            prefs.edit().putInt("high_score", score).apply();
            txtFeedback.setText("NEW HIGH SCORE!\n" + txtFeedback.getText());
        }

        double percentage = (double) score / total;

        if (percentage >= 0.8) {
            String msg = "Congratulations! You are officially prepared.";
            if (score > highScore)
                msg = "NEW HIGH SCORE!\n" + msg;
            txtFeedback.setText(msg);
            imgBadge.setVisibility(View.VISIBLE);
            btnRestart.setText("Restart Quiz");
        } else if (percentage >= 0.5) {
            String msg = "Good effort! Review the guides to improve your score.";
            if (score > highScore)
                msg = "NEW HIGH SCORE!\n" + msg;
            txtFeedback.setText(msg);
            imgBadge.setVisibility(View.GONE);
        } else {
            String msg = "Keep studying! Safety first.";
            if (score > highScore)
                msg = "NEW HIGH SCORE!\n" + msg;
            txtFeedback.setText(msg);
            imgBadge.setVisibility(View.GONE);
        }

        btnRestart.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(ResultActivity.this, QuizActivity.class));
                finish();
            }
        });

        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Navigate back to Main, clearing back stack
                Intent intent = new Intent(ResultActivity.this, MainActivity.class);
                intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
                startActivity(intent);
                finish();
            }
        });
    }
}
