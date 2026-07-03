package com.example.firstaid.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.example.firstaid.models.Procedure;
import com.example.firstaid.models.Step;
import java.util.ArrayList;
import java.util.List;

/**
 * DatabaseHelper manages the local SQLite database for the FirstAid+ application.
 * It handles the creation, upgrading, and querying of medical procedures, 
 * instructional steps, and quiz data to ensure offline availability.
 * 
 * @author Team JAR (Joseph, John, Roselida)
 */
public class DatabaseHelper extends SQLiteOpenHelper {

    private static final String DATABASE_NAME = "firstaid_db";
    private static final int DATABASE_VERSION = 2;

    // Table Names
    private static final String TABLE_PROCEDURES = "procedures";
    private static final String TABLE_STEPS = "steps";

    // Column Names - Procedures
    private static final String KEY_PROC_ID = "id";
    private static final String KEY_PROC_TITLE = "title";
    private static final String KEY_PROC_ICON = "icon_name";
    private static final String KEY_PROC_SEVERITY = "severity_level";

    // Column Names - Steps
    private static final String KEY_STEP_ID = "id";
    private static final String KEY_STEP_PROC_ID = "procedure_id";
    private static final String KEY_STEP_ORDER = "step_order";
    private static final String KEY_STEP_INSTRUCTION = "instruction";
    private static final String KEY_STEP_IMAGE = "image_resource";

    public DatabaseHelper(Context context) {
        super(context, DATABASE_NAME, null, DATABASE_VERSION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        // Create Procedures Table
        String CREATE_PROCEDURES_TABLE = "CREATE TABLE " + TABLE_PROCEDURES + "("
                + KEY_PROC_ID + " INTEGER PRIMARY KEY,"
                + KEY_PROC_TITLE + " TEXT,"
                + KEY_PROC_ICON + " TEXT,"
                + KEY_PROC_SEVERITY + " INTEGER" + ")";
        db.execSQL(CREATE_PROCEDURES_TABLE);

        // Create Steps Table
        String CREATE_STEPS_TABLE = "CREATE TABLE " + TABLE_STEPS + "("
                + KEY_STEP_ID + " INTEGER PRIMARY KEY,"
                + KEY_STEP_PROC_ID + " INTEGER,"
                + KEY_STEP_ORDER + " INTEGER,"
                + KEY_STEP_INSTRUCTION + " TEXT,"
                + KEY_STEP_IMAGE + " TEXT,"
                + "FOREIGN KEY(" + KEY_STEP_PROC_ID + ") REFERENCES " + TABLE_PROCEDURES + "(" + KEY_PROC_ID + ")"
                + ")";
        db.execSQL(CREATE_STEPS_TABLE);

        // Seed Data
        seedData(db);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_STEPS);
        db.execSQL("DROP TABLE IF EXISTS " + TABLE_PROCEDURES);
        onCreate(db);
    }

    private void seedData(SQLiteDatabase db) {
        // 1. CPR (Adult)
        insertProcedure(db, 1, "CPR (Adult)", "ic_cpr_adult", 1);
        insertStep(db, 1, 1, 1, "Call for Help. Ask a bystander to call 1199 and get an AED.", "img_phone");
        insertStep(db, 2, 1, 2, "Position Hands. Heel of one hand on center of chest. Interlock other on top.",
                "img_cpr_hand");
        insertStep(db, 3, 1, 3, "Compressions. Push hard and fast. Depth 5-6 cm. Rate 100-120 bpm.",
                "img_cpr_compress");
        insertStep(db, 4, 1, 4, "Rescue Breaths. 30 compressions -> 2 breaths. Tilt head, pinch nose, seal mouth.",
                "img_cpr_breath");
        insertStep(db, 5, 1, 5, "Repeat. Continue 30:2 cycle until help arrives or breathing starts.",
                "img_cpr_adult_1");

        // 2. CPR (Child/Infant)
        insertProcedure(db, 2, "CPR (Child/Infant)", "ic_cpr_baby", 1);
        insertStep(db, 6, 2, 1, "Initial Breaths. Give 5 initial rescue breaths before starting compressions.",
                "img_cpr_baby_4");
        insertStep(db, 7, 2, 2, "Position Hands. Infant: 2 fingers. Child: 1 hand heel.", "img_cpr_baby_2");
        insertStep(db, 8, 2, 3, "Compressions. Press down 1/3 depth. Rate 100-120 bpm.", "img_cpr_baby_3");
        insertStep(db, 9, 2, 4, "Cycle. Maintain ratio of 30 compressions : 2 breaths.", "img_cpr_baby_3");
        insertStep(db, 10, 2, 5, "Call 1199. If alone, perform CPR for 1 minute before leaving to call.", "img_phone");

        // 3. Choking
        insertProcedure(db, 3, "Choking", "ic_choking", 1);
        insertStep(db, 11, 3, 1, "Back Blows. Give up to 5 sharp blows between shoulder blades.", "img_choking_2");
        insertStep(db, 12, 3, 2, "Abdominal Thrusts. Fist above navel. Pull sharply inward and upward.",
                "img_choking_3");
        insertStep(db, 13, 3, 3, "Repeat. Cycle 5 back blows and 5 abdominal thrusts.", "img_choking_4");

        // 4. Severe Bleeding
        insertProcedure(db, 4, "Severe Bleeding", "ic_bleeding", 1);
        insertStep(db, 14, 4, 1, "Protect Yourself. Wear disposable gloves if available.", "img_bleeding_1");
        insertStep(db, 15, 4, 2, "Direct Pressure. Apply firm pressure using sterile dressing.", "img_bleeding_1");
        insertStep(db, 16, 4, 3, "Elevate. Raise injured limb above heart level.", "img_bleeding_2");
        insertStep(db, 17, 4, 4, "Bandage. Secure dressing tight but don't stop circulation.", "img_bleeding_3");
        insertStep(db, 18, 4, 5, "Call 1199. Monitor for shock (pale, cold skin).", "img_phone");

        // 5. Burns & Scalds
        insertProcedure(db, 5, "Burns & Scalds", "ic_burns", 2);
        insertStep(db, 19, 5, 1, "Stop the Burning. Move away from heat source. Put out flames.", "img_burns_1");
        insertStep(db, 20, 5, 2, "Cool the Burn. Cool running tepid water for 20 mins. NO ICE.", "img_burns_1");
        insertStep(db, 21, 5, 3, "Remove Constrictions. Remove jewelry/clothing near burn before swelling.",
                "img_burns_1");
        insertStep(db, 22, 5, 4, "Cover. Cover loosely with cling film or sterile non-fluffy dressing.",
                "img_burns_cover");

        // 6. Fractures
        insertProcedure(db, 6, "Fractures", "ic_fracture", 2);
        insertStep(db, 23, 6, 1, "Immobilize. Support injury with hand or use padding/slings.", "img_fracture_1");
        insertStep(db, 24, 6, 2, "Splinting. Secure injured limb to a sound part of the body.", "img_fracture_2");
        insertStep(db, 25, 6, 3, "Check Circulation. Check for feeling, warmth, and skin color.", "img_fracture_3");
        insertStep(db, 26, 6, 4, "Call 1199. Do not move person unnecessarily.", "img_phone");

        // 7. Seizures
        insertProcedure(db, 7, "Seizures", "ic_seizure", 2);
        insertStep(db, 27, 7, 1, "Safety. Move dangerous objects away. Do not restrain.", "img_seizure_1");
        insertStep(db, 28, 7, 2, "Protect the Head. Place something soft under their head.", "img_seizure_2");
        insertStep(db, 29, 7, 3, "Time It. Call 1199 if > 5 mins. Note start/end time.", "img_seizure_3");
        insertStep(db, 30, 7, 4, "Post-Seizure. Check breathing and roll into Recovery Position.", "img_recovery");

        // 8. Snake Bites
        insertProcedure(db, 8, "Snake Bites", "ic_snake", 1);
        insertStep(db, 31, 8, 1, "Stay Calm. Reassure patient. Panic spreads venom.", "img_snake_1");
        insertStep(db, 32, 8, 2, "Immobilize. Keep limb still and below heart level.", "img_snake_2");
        insertStep(db, 33, 8, 3, "Description. Remember snake color/shape.", "img_snake_no");
        insertStep(db, 34, 8, 4, "Call 1199. Transport to hospital immediately. NO sucking venom.", "img_ambulance");

        // 9. Poisoning
        insertProcedure(db, 9, "Poisoning", "ic_poison", 1);
        insertStep(db, 35, 9, 1, "Safety Check. Ensure you are not exposed to poison.", "img_poison_1");
        insertStep(db, 36, 9, 2, "Identify. What was taken? Keep packaging.", "img_poison_1");
        insertStep(db, 37, 9, 3, "Call 1199. Follow dispatcher's advice. NO vomiting unless told.", "img_phone");
        insertStep(db, 38, 9, 4, "Monitor. Watch breathing. Recovery Position if unconscious.", "img_recovery");

        // 10. Heart Attack
        insertProcedure(db, 10, "Heart Attack", "ic_heart", 1);
        insertStep(db, 39, 10, 1, "Call 1199 Immediately. This is a medical emergency.", "img_phone");
        insertStep(db, 40, 10, 2, "Position. Sit down, knees bent, head supported (W Position).", "img_heart_sit");
        insertStep(db, 41, 10, 3, "Medication. Chew 300mg Aspirin if not allergic.", "img_aspirin");
        insertStep(db, 42, 10, 4, "Monitor. Be prepared to perform CPR if they stop breathing.", "img_cpr_adult_1");
    }

    private void insertProcedure(SQLiteDatabase db, int id, String title, String icon, int severity) {
        ContentValues values = new ContentValues();
        values.put(KEY_PROC_ID, id);
        values.put(KEY_PROC_TITLE, title);
        values.put(KEY_PROC_ICON, icon);
        values.put(KEY_PROC_SEVERITY, severity);
        db.insert(TABLE_PROCEDURES, null, values);
    }

    private void insertStep(SQLiteDatabase db, int id, int procId, int order, String steps, String img) {
        ContentValues values = new ContentValues();
        values.put(KEY_STEP_ID, id);
        values.put(KEY_STEP_PROC_ID, procId);
        values.put(KEY_STEP_ORDER, order);
        values.put(KEY_STEP_INSTRUCTION, steps);
        values.put(KEY_STEP_IMAGE, img);
        db.insert(TABLE_STEPS, null, values);
    }

    /**
     * Retrieves all medical procedures from the database.
     * 
     * @return A list of all Procedure objects.
     */
    public List<Procedure> getAllProcedures() {
        List<Procedure> procedureList = new ArrayList<>();
        String selectQuery = "SELECT * FROM " + TABLE_PROCEDURES;
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, null);

        if (cursor.moveToFirst()) {
            do {
                Procedure procedure = new Procedure(
                        cursor.getInt(0),
                        cursor.getString(1),
                        cursor.getString(2),
                        cursor.getInt(3));
                procedureList.add(procedure);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return procedureList;
    }

    /**
     * Searches for procedures by title.
     * 
     * @param query The search term.
     * @return A list of procedures matching the search query.
     */
    public List<Procedure> searchProcedures(String query) {
        List<Procedure> procedureList = new ArrayList<>();
        String selectQuery = "SELECT * FROM " + TABLE_PROCEDURES + " WHERE " + KEY_PROC_TITLE + " LIKE ?";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, new String[] { "%" + query + "%" });

        if (cursor.moveToFirst()) {
            do {
                Procedure procedure = new Procedure(
                        cursor.getInt(0),
                        cursor.getString(1),
                        cursor.getString(2),
                        cursor.getInt(3));
                procedureList.add(procedure);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return procedureList;
    }

    /**
     * Retrieves the instructional steps for a specific procedure.
     * 
     * @param procedureId The ID of the procedure.
     * @return A list of Step objects ordered by their sequence.
     */
    public List<Step> getStepsForProcedure(int procedureId) {
        List<Step> stepList = new ArrayList<>();
        String selectQuery = "SELECT * FROM " + TABLE_STEPS + " WHERE " + KEY_STEP_PROC_ID + " = ? ORDER BY "
                + KEY_STEP_ORDER + " ASC";
        SQLiteDatabase db = this.getReadableDatabase();
        Cursor cursor = db.rawQuery(selectQuery, new String[] { String.valueOf(procedureId) });

        if (cursor.moveToFirst()) {
            do {
                Step step = new Step(
                        cursor.getInt(0),
                        cursor.getInt(1),
                        cursor.getInt(2),
                        cursor.getString(3),
                        cursor.getString(4));
                stepList.add(step);
            } while (cursor.moveToNext());
        }
        cursor.close();
        return stepList;
    }
}
