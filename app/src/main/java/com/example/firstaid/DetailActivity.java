package com.example.firstaid;

import android.content.Intent;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.view.View;
import android.widget.ImageView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.google.android.material.floatingactionbutton.FloatingActionButton;
import com.example.firstaid.db.DatabaseHelper;
import com.example.firstaid.models.Step;
import java.util.List;
import java.util.Locale;

public class DetailActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private StepsAdapter adapter;
    private DatabaseHelper dbHelper;
    private List<Step> stepList;
    private TextToSpeech tts;
    private FloatingActionButton fabSpeak;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        // Get extras
        int procedureId = getIntent().getIntExtra("PROCEDURE_ID", -1);
        String title = getIntent().getStringExtra("PROCEDURE_TITLE");
        String iconName = getIntent().getStringExtra("PROCEDURE_ICON");

        if (procedureId == -1) {
            finish();
            return;
        }

        // Setup Toolbar
        Toolbar toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        if (getSupportActionBar() != null) {
            getSupportActionBar().setTitle(title);
            getSupportActionBar().setDisplayHomeAsUpEnabled(true);
            toolbar.setNavigationOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    onBackPressed();
                }
            });
        }

        // Setup Header Image
        ImageView imgHeader = findViewById(R.id.imgHeader);
        int resId = getResources().getIdentifier(iconName, "drawable", getPackageName());
        if (resId != 0) {
            imgHeader.setImageResource(resId);
        } else {
            imgHeader.setImageResource(R.drawable.ic_launcher_round); // Placeholder
        }

        // Load Steps
        dbHelper = new DatabaseHelper(this);
        stepList = dbHelper.getStepsForProcedure(procedureId);

        // Setup RecyclerView
        recyclerView = findViewById(R.id.recyclerViewSteps);
        recyclerView.setLayoutManager(new LinearLayoutManager(this));
        adapter = new StepsAdapter(this, stepList);
        recyclerView.setAdapter(adapter);

        // Initialize TTS
        tts = new TextToSpeech(this, new TextToSpeech.OnInitListener() {
            @Override
            public void onInit(int status) {
                if (status == TextToSpeech.SUCCESS) {
                    int result = tts.setLanguage(Locale.UK); // or Locale.US, or Locale.getDefault()
                    if (result == TextToSpeech.LANG_MISSING_DATA || result == TextToSpeech.LANG_NOT_SUPPORTED) {
                        Toast.makeText(DetailActivity.this, "TTS Language not supported", Toast.LENGTH_SHORT).show();
                    } else {
                        tts.setOnUtteranceProgressListener(new android.speech.tts.UtteranceProgressListener() {
                            @Override
                            public void onStart(String utteranceId) {}

                            @Override
                            public void onDone(String utteranceId) {
                                runOnUiThread(new Runnable() {
                                    @Override
                                    public void run() {
                                        isSpeaking = false;
                                        fabSpeak.setImageResource(R.drawable.ic_speaker);
                                    }
                                });
                            }

                            @Override
                            public void onError(String utteranceId) {}
                        });
                    }
                } else {
                    Toast.makeText(DetailActivity.this, "TTS Initialization failed", Toast.LENGTH_SHORT).show();
                }
            }
        });

        // Setup FAB
        fabSpeak = findViewById(R.id.fabSpeak);
        fabSpeak.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                speakSteps();
            }
        });
    }

    private boolean isSpeaking = false;

    private void speakSteps() {
        if (tts == null)
            return;

        if (isSpeaking) {
            tts.stop();
            isSpeaking = false;
            fabSpeak.setImageResource(R.drawable.ic_speaker);
        } else {
            isSpeaking = true;
            fabSpeak.setImageResource(R.drawable.ic_stop);

            for (Step step : stepList) {
                String text = "Step " + step.getStepOrder() + ". " + step.getInstruction();
                tts.speak(text, TextToSpeech.QUEUE_ADD, null, "ID");
                tts.playSilentUtterance(1000, TextToSpeech.QUEUE_ADD, null);
            }
        }
    }

    @Override
    protected void onDestroy() {
        if (tts != null) {
            tts.stop();
            tts.shutdown();
        }
        super.onDestroy();
    }
}
