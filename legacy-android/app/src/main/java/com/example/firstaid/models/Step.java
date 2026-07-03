package com.example.firstaid.models;

public class Step {
    private int id;
    private int procedureId;
    private int stepOrder;
    private String instruction;
    private String imageResource;

    public Step(int id, int procedureId, int stepOrder, String instruction, String imageResource) {
        this.id = id;
        this.procedureId = procedureId;
        this.stepOrder = stepOrder;
        this.instruction = instruction;
        this.imageResource = imageResource;
    }

    public int getId() { return id; }
    public int getProcedureId() { return procedureId; }
    public int getStepOrder() { return stepOrder; }
    public String getInstruction() { return instruction; }
    public String getImageResource() { return imageResource; }
}
