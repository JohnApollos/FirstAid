package com.example.firstaid.utils;

import com.example.firstaid.models.Question;
import java.util.ArrayList;
import java.util.List;

public class QuizData {

    public static List<Question> getAllQuestions() {
        List<Question> questions = new ArrayList<>();

        // Part 1: Multiple Choice
        questions.add(new Question(
                "What is the correct ratio of chest compressions to rescue breaths for Adult CPR?",
                new String[] { "15 compressions : 2 breaths", "30 compressions : 2 breaths",
                        "30 compressions : 5 breaths", "Continuous compressions only" },
                1, "30:2 is the standard ratio."));

        questions.add(new Question(
                "In Kenya, what is the primary emergency number for medical dispatch?",
                new String[] { "911", "1199", "999", "211" },
                1, "1199 is the emergency number."));

        questions.add(new Question(
                "When treating a burn, how long should you cool the area with running tepid water?",
                new String[] { "5 minutes", "10 minutes", "20 minutes", "Until pain stops" },
                2, "Cool for at least 20 minutes."));

        questions.add(new Question(
                "For a severe bleeding wound, what should you do if the first layer of gauze soaks through?",
                new String[] { "Remove it immediately", "Apply a tourniquet", "Add more dressing on top",
                        "Wash the wound" },
                2, "Do not remove the first layer; it disturbs clotting."));

        questions.add(new Question(
                "What is the 'W Position' used for?",
                new String[] { "Snake bite treatment", "Fracture stabilization", "Heart Attack patient",
                        "Seizure recovery" },
                2, "It eases strain on the heart."));

        questions.add(new Question(
                "Which medication is recommended for a conscious Heart Attack patient (if not allergic)?",
                new String[] { "Paracetamol (500mg)", "Ibuprofen (200mg)", "Aspirin (300mg), chewed",
                        "Aspirin (300mg), swallowed" },
                2, "Chewed aspirin enters the bloodstream faster."));

        questions.add(new Question(
                "When performing the Heimlich Maneuver (Abdominal Thrusts), where do you place your fist?",
                new String[] { "Center of chest", "Just above navel, below ribs", "Lower abdomen",
                        "Between shoulder blades" },
                1, "Above the navel to effectively push air up."));

        questions.add(new Question(
                "For a snake bite, where should the bitten limb be positioned relative to the heart?",
                new String[] { "Above heart level", "At heart level", "Below heart level", "Does not matter" },
                2, "Below heart level to slow venom spread."));

        // Part 2: True or False
        questions.add(new Question(
                "You should apply butter or toothpaste to a burn to soothe the skin after cooling it.",
                new String[] { "True", "False", "", "" },
                1, "False. Never use butter or toothpaste."));

        questions.add(new Question(
                "If an infant (under 1 year) needs CPR, you should start with 5 initial rescue breaths.",
                new String[] { "True", "False", "", "" },
                0, "True. Children need oxygen first."));

        questions.add(new Question(
                "During a seizure, you should put a spoon or wallet in the person's mouth.",
                new String[] { "True", "False", "", "" },
                1, "False. Choking hazard."));

        questions.add(new Question(
                "If someone has swallowed poison, you should immediately make them vomit.",
                new String[] { "True", "False", "", "" },
                1, "False. Vomiting can cause double damage."));

        questions.add(new Question(
                "For a fracture, you should try to straighten the broken bone before splinting it.",
                new String[] { "True", "False", "", "" },
                1, "False. Immobilize as found."));

        questions.add(new Question(
                "In remote areas, prioritize stabilizing and transporting rather than waiting for help.",
                new String[] { "True", "False", "", "" },
                0, "True. Load and go."));

        // Part 3: Critical Numbers (Converted to MC)
        questions.add(new Question(
                "The correct rate for chest compressions is between ____ and ____ beats per minute.",
                new String[] { "60 and 80", "100 and 120", "140 and 160", "80 and 100" },
                1, "100-120 bpm."));

        questions.add(new Question(
                "For an adult, the depth of chest compressions should be approximately ____ to ____ cm.",
                new String[] { "2 to 3", "5 to 6", "8 to 10", "1 to 2" },
                1, "5-6 cm."));

        questions.add(new Question(
                "You should cool a burn with water for at least ____ minutes.",
                new String[] { "5 minutes", "10 minutes", "15 minutes", "20 minutes" },
                3, "20 minutes."));

        return questions;
    }
}
