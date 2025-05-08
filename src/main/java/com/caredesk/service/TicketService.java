package com.caredesk.service;

import com.caredesk.model.Ticket;
import com.caredesk.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketService {

    // Create Ticket
    public boolean createTicket(Ticket ticket) {
        String query = "INSERT INTO tickets (user_id, subject, description, category, status) VALUES (?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticket.getUserId());
            stmt.setString(2, ticket.getSubject());
            stmt.setString(3, ticket.getDescription());
            stmt.setString(4, ticket.getCategory());
            stmt.setString(5, ticket.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Ticket by ID
    public Ticket getTicket(int id) {
        String query = "SELECT * FROM view_tickets WHERE ticket_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setUserId(rs.getInt("user_id"));
                ticket.setCustomerName(rs.getString("customer_name"));
                ticket.setSubject(rs.getString("subject"));
                ticket.setDescription(rs.getString("description"));
                ticket.setCategory(rs.getString("category"));
                ticket.setStatus(rs.getString("status"));
                ticket.setCreatedAt(rs.getString("created_at"));
                return ticket;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Tickets
    public List<Ticket> getAllTickets() {
        List<Ticket> tickets = new ArrayList<>();
        String query = "SELECT * FROM view_tickets ORDER BY ticket_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Ticket ticket = new Ticket();
                ticket.setTicketId(rs.getInt("ticket_id"));
                ticket.setUserId(rs.getInt("user_id"));
                ticket.setCustomerName(rs.getString("customer_name"));
                ticket.setSubject(rs.getString("subject"));
                ticket.setDescription(rs.getString("description"));
                ticket.setCategory(rs.getString("category"));
                ticket.setStatus(rs.getString("status"));
                ticket.setCreatedAt(rs.getString("created_at"));
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }

    // Update Ticket
    public boolean updateTicket(Ticket ticket) {
        String query = "UPDATE tickets SET user_id = ?, subject = ?, description = ?, category = ?, status = ? WHERE ticket_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, ticket.getUserId());
            stmt.setString(2, ticket.getSubject());
            stmt.setString(3, ticket.getDescription());
            stmt.setString(4, ticket.getCategory());
            stmt.setString(5, ticket.getStatus());
            stmt.setInt(6, ticket.getTicketId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Ticket
    public boolean deleteTicket(int id) {
        String query = "DELETE FROM tickets WHERE ticket_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}