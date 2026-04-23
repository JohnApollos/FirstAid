package com.example.firstaid;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.SearchView;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.example.firstaid.db.DatabaseHelper;
import com.example.firstaid.models.Procedure;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private RecyclerView recyclerView;
    private ProceduresAdapter adapter;
    private DatabaseHelper dbHelper;
    private List<Procedure> procedureList;
    private SearchView searchView;
    private Button btnEmergency;
    private Button navHome, navQuiz, navAbout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize DB
        dbHelper = new DatabaseHelper(this);
        procedureList = dbHelper.getAllProcedures();

        // Setup RecyclerView
        recyclerView = findViewById(R.id.recyclerViewProcedures);
        recyclerView.setLayoutManager(new GridLayoutManager(this, 2));
        adapter = new ProceduresAdapter(this, procedureList);
        recyclerView.setAdapter(adapter);

        // Setup Search
        searchView = findViewById(R.id.searchView);
        searchView.setOnQueryTextListener(new SearchView.OnQueryTextListener() {
            @Override
            public boolean onQueryTextSubmit(String query) {
                filter(query);
                return false;
            }

            @Override
            public boolean onQueryTextChange(String newText) {
                filter(newText);
                return false;
            }
        });

        // Setup Emergency Button
        btnEmergency = findViewById(R.id.btnEmergency);
        btnEmergency.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(Intent.ACTION_DIAL);
                intent.setData(Uri.parse("tel:1199"));
                startActivity(intent);
            }
        });

        // Navigation
        navHome = findViewById(R.id.navHome);
        navQuiz = findViewById(R.id.navQuiz);
        navAbout = findViewById(R.id.navAbout);

        navQuiz.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, QuizSelectionActivity.class));
            }
        });

        navAbout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                startActivity(new Intent(MainActivity.this, AboutActivity.class));
            }
        });
    }

    private void filter(String text) {
        if (text.isEmpty()) {
            adapter.updateList(procedureList);
        } else {
            List<Procedure> filteredList = dbHelper.searchProcedures(text);
            adapter.updateList(filteredList);
        }
    }
    
    @Override
    protected void onResume() {
        super.onResume();
        // Refresh list if needed (e.g., if we had favorites or dynamic status)
    }
}
