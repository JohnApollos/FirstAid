package com.example.firstaid;

import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ProgressBar;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import com.example.firstaid.models.Question;
import com.example.firstaid.utils.QuizData;
import java.util.Collections;
import java.util.List;

public class QuizActivity extends AppCompatActivity {

    private TextView txtQuestionCount, txtQuestion;
    private RadioGroup radioGroup;
    private RadioButton optionA, optionB, optionC, optionD;
    private Button btnNext;
    private ProgressBar progressBar;

    private List<Question> quizList;
    private int currentQuestionIndex = 0;
    private int score = 0;
    private boolean answered = false;

    private static final int TOTAL_QUESTIONS = 5; // We take only 5 random questions

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        // Setup Toolbar
        androidx.appcompat.widget.Toolbar toolbar = findViewById(R.id.toolbarQuiz);
        setSupportActionBar(toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            getSupportActionBar().setDisplayShowHomeEnabled(true);
            getSupportActionBar().setTitle("FirstAid+ Quiz");
        }
        toolbar.setNavigationOnClickListener(v -> finish()); // Go back home/close activity

        txtQuestionCount = findViewById(R.id.txtQuestionCount);
        txtQuestion = findViewById(R.id.txtQuestion);
        radioGroup = findViewById(R.id.radioGroupOptions);
        optionA = findViewById(R.id.optionA);
        optionB = findViewById(R.id.optionB);
        optionC = findViewById(R.id.optionC);
        optionD = findViewById(R.id.optionD);
        btnNext = findViewById(R.id.btnNextQuestion);
        progressBar = findViewById(R.id.progressBarQuiz);

        loadQuiz();
        showQuestion();

        btnNext.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                if (!answered) {
                    if (radioGroup.getCheckedRadioButtonId() == -1) {
                        Toast.makeText(QuizActivity.this, "Please select an answer", Toast.LENGTH_SHORT).show();
                    } else {
                        checkAnswer();
                    }
                } else {
                    showNextQuestion();
                }
            }
        });
    }

    private void loadQuiz() {
        List<Question> allQuestions = QuizData.getAllQuestions();
        Collections.shuffle(allQuestions);
        // Take first 10 or size if less
        int size = Math.min(TOTAL_QUESTIONS, allQuestions.size());
        quizList = allQuestions.subList(0, size);
        progressBar.setMax(size);
    }

    private void showQuestion() {
        radioGroup.clearCheck();

        // Reset colors and state
        optionA.setTextColor(Color.BLACK);
        optionB.setTextColor(Color.BLACK);
        optionC.setTextColor(Color.BLACK);
        optionD.setTextColor(Color.BLACK);

        optionA.setBackgroundColor(Color.TRANSPARENT);
        optionB.setBackgroundColor(Color.TRANSPARENT);
        optionC.setBackgroundColor(Color.TRANSPARENT);
        optionD.setBackgroundColor(Color.TRANSPARENT);

        enableOptions(true);

        Question q = quizList.get(currentQuestionIndex);

        txtQuestion.setText(q.getQuestionText());
        String[] opts = q.getOptions();

        // Handle cases where fewer than 4 options exist (e.g. True/False)
        optionA.setText(opts[0]);
        optionB.setText(opts[1]);
        optionC.setVisibility(opts.length > 2 && !opts[2].isEmpty() ? View.VISIBLE : View.GONE);
        if (opts.length > 2)
            optionC.setText(opts[2]);
        optionD.setVisibility(opts.length > 3 && !opts[3].isEmpty() ? View.VISIBLE : View.GONE);
        if (opts.length > 3)
            optionD.setText(opts[3]);

        txtQuestionCount.setText("Question " + (currentQuestionIndex + 1) + " of " + quizList.size());
        progressBar.setProgress(currentQuestionIndex + 1);

        answered = false;
        btnNext.setText("CONFIRM");
        btnNext.setEnabled(true);
    }

    private void enableOptions(boolean enable) {
        for (int i = 0; i < radioGroup.getChildCount(); i++) {
            radioGroup.getChildAt(i).setEnabled(enable);
        }
    }

    private void checkAnswer() {
        answered = true;
        RadioButton selected = findViewById(radioGroup.getCheckedRadioButtonId());
        int selectedIndex = -1;

        if (selected == optionA)
            selectedIndex = 0;
        else if (selected == optionB)
            selectedIndex = 1;
        else if (selected == optionC)
            selectedIndex = 2;
        else if (selected == optionD)
            selectedIndex = 3;

        Question q = quizList.get(currentQuestionIndex);

        if (selectedIndex == q.getCorrectOptionIndex()) {
            score++;
            selected.setTextColor(Color.GREEN);
            Toast.makeText(this, "Correct!", Toast.LENGTH_SHORT).show();
        } else {
            selected.setTextColor(Color.RED);
            // Highlight correct one
            RadioButton correctBtn = null;
            switch (q.getCorrectOptionIndex()) {
                case 0:
                    correctBtn = optionA;
                    break;
                case 1:
                    correctBtn = optionB;
                    break;
                case 2:
                    correctBtn = optionC;
                    break;
                case 3:
                    correctBtn = optionD;
                    break;
            }
            if (correctBtn != null)
                correctBtn.setTextColor(Color.GREEN);

            Toast.makeText(this, "Wrong!", Toast.LENGTH_SHORT).show();
        }

        // Show explanation via Toast or separate view if desired (omitted for
        // simplicity per requirements)

        enableOptions(false);

        if (currentQuestionIndex < quizList.size() - 1) {
            btnNext.setText("NEXT");
        } else {
            btnNext.setText("FINISH");
        }
    }

    private void showNextQuestion() {
        if (currentQuestionIndex < quizList.size() - 1) {
            currentQuestionIndex++;
            showQuestion();
        } else {
            finishQuiz();
        }
    }

    private void finishQuiz() {
        Intent intent = new Intent(QuizActivity.this, ResultActivity.class);
        intent.putExtra("SCORE", score);
        intent.putExtra("TOTAL", quizList.size());
        startActivity(intent);
        finish();
    }
}
