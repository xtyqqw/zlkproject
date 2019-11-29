package com.zlk.zlkproject.entity;

/**
 * @ClassName Faq
 * @Description: FAQ实体类
 * @Author LuanKe
 * Date 2019/11/25 14:34
 **/
public class Faq {
    private int faqId;
    private int coursesId;
    private String answer;
    private String question;

    public int getFaqId() {
        return faqId;
    }

    public void setFaqId(int faqId) {
        this.faqId = faqId;
    }

    public int getCoursesId() {
        return coursesId;
    }

    public void setCoursesId(int coursesId) {
        this.coursesId = coursesId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public Faq(int faqId, int coursesId, String answer, String question) {
        this.faqId = faqId;
        this.coursesId = coursesId;
        this.answer = answer;
        this.question = question;
    }

    public Faq() {
    }

    @Override
    public String toString() {
        return "Faq{" +
                "faqId=" + faqId +
                ", coursesId=" + coursesId +
                ", answer='" + answer + '\'' +
                ", question='" + question + '\'' +
                '}';
    }
}
