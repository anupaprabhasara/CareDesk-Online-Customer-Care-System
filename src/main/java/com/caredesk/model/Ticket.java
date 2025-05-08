package com.caredesk.model;

public class Ticket {
	private int ticketId;
    private int userId;
    private String subject;
    private String description;
    private String category;
    private String status;
    private String createdAt;

    // View table field
    private String customerName;

	public int getTicketId() {
		return ticketId;
	}
	public int getUserId() {
		return userId;
	}
	public String getSubject() {
		return subject;
	}
	public String getDescription() {
		return description;
	}
	public String getCategory() {
		return category;
	}
	public String getStatus() {
		return status;
	}
	public String getCreatedAt() {
		return createdAt;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setTicketId(int ticketId) {
		this.ticketId = ticketId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
}