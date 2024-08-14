package com.example.EmployeeManagementSystem.Projections;

public class EmployeeNameOnly {
    private String name;

    public EmployeeNameOnly(String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name=name;
    }
}
