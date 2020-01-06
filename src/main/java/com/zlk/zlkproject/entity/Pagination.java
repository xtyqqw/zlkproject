package com.zlk.zlkproject.entity;

import java.util.List;

public class Pagination {
    /**数据封装*/
    private List<?> list;
    /**当前页*/
    private Integer page;
    /**每页显示条数*/
    private Integer limit;
    /**总条数*/
    private Integer totalCount;
    /**总页数*/
    private Integer totalPage;
    /**起始页*/
    private Integer startPage;

    private User user;

    private String userId;

    public Question getQuestion() {
        return question;
    }

    public void setQuestion(Question question) {
        this.question = question;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String qusetionId) {
        this.questionId = qusetionId;
    }

    public Pagination(List<?> list, Question question, String qusetionId) {
        this.list = list;
        this.question = question;
        this.questionId = qusetionId;
    }

    private Question question;

    private String questionId;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<?> getList() {
        return list;
    }

    public void setList(List<?> list) {
        this.list = list;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getStartPage() {
        return startPage;
    }

    public void setStartPage(Integer startPage) {
        this.startPage = startPage;
    }


    public Pagination(List<?> list, Integer page, Integer limit, Integer totalCount, Integer totalPage, Integer startPage, User user, String userId) {
        this.list = list;
        this.page = page;
        this.limit = limit;
        this.totalCount = totalCount;
        this.totalPage = totalPage;
        this.startPage = startPage;
        this.user = user;
        this.userId = userId;
    }

    public Pagination() {
    }
}
