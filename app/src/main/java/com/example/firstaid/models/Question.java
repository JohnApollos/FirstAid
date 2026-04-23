package com.example.firstaid.models;

public class Question {
    private String questionText;
    private String[] options; // Array of 4 strings
    private int correctOptionIndex; // 0, 1, 2, or 3
    private String explanation; // Optional, for future use

    public Question(String questionText, String[] options, int correctOptionIndex, String explanation) {
        this.questionText = questionText;
        this.options = options;
        this.correctOptionIndex = correctOptionIndex;
        this.explanation = explanation;
    }

    public String getQuestionText() {
        return questionText;
    }

    public String[] getOptions() {
        return options;
    }

    public int getCorrectOptionIndex() {
        return correctOptionIndex;
    }

    public String getExplanation() {
        return explanation;
    }
}
