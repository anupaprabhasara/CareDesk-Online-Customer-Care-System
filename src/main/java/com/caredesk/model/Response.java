package com.caredesk.model;

public class Response {
	private int responseId;
    private int ticketId;
    private int adminId;
    private String message;
    private String createdAt;

    // View table fields
    private String responderName;
    private String responderRole;
    
	public int getResponseId() {
		return responseId;
	}
	public int getTicketId() {
		return ticketId;
	}
	public int getAdminId() {
		return adminId;
	}
	public String getMessage() {
		return message;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getResponderName() {
		return responderName;
	}
	public String getResponderRole() {
		return responderRole;
	}
	public void setResponseId(int responseId) {
		this.responseId = responseId;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setResponderName(String responderName) {
		this.responderName = responderName;
	}
	public void setResponderRole(String responderRole) {
		this.responderRole = responderRole;
	}
}