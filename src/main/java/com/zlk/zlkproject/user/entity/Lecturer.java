package com.zlk.zlkproject.user.entity;

public class Lecturer {
    private Integer lecturerId;
    private String lecturerName;
    private String lecturerIntro;
    private String lecturerPhotoa;
    private String lecturerPhotor;

    public Lecturer(Integer lecturerId, String lecturerName, String lecturerIntro, String lecturerPhotoa, String lecturerPhotor) {
        this.lecturerId = lecturerId;
        this.lecturerName = lecturerName;
        this.lecturerIntro = lecturerIntro;
        this.lecturerPhotoa = lecturerPhotoa;
        this.lecturerPhotor = lecturerPhotor;
    }

    public Lecturer() {
    }

    public Integer getLecturerId() {
        return lecturerId;
    }

    public void setLecturerId(Integer lecturerId) {
        this.lecturerId = lecturerId;
    }

    public String getLecturerName() {
        return lecturerName;
    }

    public void setLecturerName(String lecturerName) {
        this.lecturerName = lecturerName;
    }

    public String getLecturerIntro() {
        return lecturerIntro;
    }

    public void setLecturerIntro(String lecturerIntro) {
        this.lecturerIntro = lecturerIntro;
    }

    public String getLecturerPhotoa() {
        return lecturerPhotoa;
    }

    public void setLecturerPhotoa(String lecturerPhotoa) {
        this.lecturerPhotoa = lecturerPhotoa;
    }

    public String getLecturerPhotor() {
        return lecturerPhotor;
    }

    public void setLecturerPhotor(String lecturerPhotor) {
        this.lecturerPhotor = lecturerPhotor;
    }
}
