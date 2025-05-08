package com.caredesk.model;

public class Feedback {
	private int feedbackId;
    private int responseId;
    private int userId;
    private int rating;
    private String comment;

    // View table field
    private String userName;

	public int getFeedbackId() {
		return feedbackId;
	}
	public int getResponseId() {
		return responseId;
	}
	public int getUserId() {
		return userId;
	}
	public int getRating() {
		return rating;
	}
	public String getComment() {
		return comment;
	}
	public String getUserName() {
		return userName;
	}
	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}
	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
}