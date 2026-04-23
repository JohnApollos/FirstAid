package com.example.firstaid.models;

public class Procedure {
    private int id;
    private String title;
    private String iconName;
    private int severityLevel;

    public Procedure(int id, String title, String iconName, int severityLevel) {
        this.id = id;
        this.title = title;
        this.iconName = iconName;
        this.severityLevel = severityLevel;
    }

    public int getId() { return id; }
    public String getTitle() { return title; }
    public String getIconName() { return iconName; }
    public int getSeverityLevel() { return severityLevel; }
}
