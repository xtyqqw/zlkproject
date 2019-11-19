package com.zlk.zlkproject.course.entity;

/**
 * @ClassName courses
 * @Description:
 * @Author LuanKe
 * Date 2019/11/19 16:15
 **/
public class Courses {
    private int coursesId;
    private String coursesName;
    private int studentNum;
    private int chapterNum;
    private int sectionNum;
    private double price;
    private String coverPic;
    private String introduceVideo;
    private String introduceText;
    private String introducePic;
    private String featureText;
    private String featurePic;

    public int getCoursesId() {
        return coursesId;
    }

    public void setCoursesId(int coursesId) {
        this.coursesId = coursesId;
    }

    public String getCoursesName() {
        return coursesName;
    }

    public void setCoursesName(String coursesName) {
        this.coursesName = coursesName;
    }

    public int getStudentNum() {
        return studentNum;
    }

    public void setStudentNum(int studentNum) {
        this.studentNum = studentNum;
    }

    public int getChapterNum() {
        return chapterNum;
    }

    public void setChapterNum(int chapterNum) {
        this.chapterNum = chapterNum;
    }

    public int getSectionNum() {
        return sectionNum;
    }

    public void setSectionNum(int sectionNum) {
        this.sectionNum = sectionNum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCoverPic() {
        return coverPic;
    }

    public void setCoverPic(String coverPic) {
        this.coverPic = coverPic;
    }

    public String getIntroduceVideo() {
        return introduceVideo;
    }

    public void setIntroduceVideo(String introduceVideo) {
        this.introduceVideo = introduceVideo;
    }

    public String getIntroduceText() {
        return introduceText;
    }

    public void setIntroduceText(String introduceText) {
        this.introduceText = introduceText;
    }

    public String getIntroducePic() {
        return introducePic;
    }

    public void setIntroducePic(String introducePic) {
        this.introducePic = introducePic;
    }

    public String getFeatureText() {
        return featureText;
    }

    public void setFeatureText(String featureText) {
        this.featureText = featureText;
    }

    public String getFeaturePic() {
        return featurePic;
    }

    public void setFeaturePic(String featurePic) {
        this.featurePic = featurePic;
    }

    public Courses(int coursesId, String coursesName, int studentNum, int chapterNum, int sectionNum, double price, String coverPic, String introduceVideo, String introduceText, String introducePic, String featureText, String featurePic) {
        this.coursesId = coursesId;
        this.coursesName = coursesName;
        this.studentNum = studentNum;
        this.chapterNum = chapterNum;
        this.sectionNum = sectionNum;
        this.price = price;
        this.coverPic = coverPic;
        this.introduceVideo = introduceVideo;
        this.introduceText = introduceText;
        this.introducePic = introducePic;
        this.featureText = featureText;
        this.featurePic = featurePic;
    }

    public Courses() {
    }

    @Override
    public String toString() {
        return "Courses{" +
                "coursesId=" + coursesId +
                ", coursesName='" + coursesName + '\'' +
                ", studentNum=" + studentNum +
                ", chapterNum=" + chapterNum +
                ", sectionNum=" + sectionNum +
                ", price=" + price +
                ", coverPic='" + coverPic + '\'' +
                ", introduceVideo='" + introduceVideo + '\'' +
                ", introduceText='" + introduceText + '\'' +
                ", introducePic='" + introducePic + '\'' +
                ", featureText='" + featureText + '\'' +
                ", featurePic='" + featurePic + '\'' +
                '}';
    }
}
