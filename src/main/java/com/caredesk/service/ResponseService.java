package com.caredesk.service;

import com.caredesk.model.Response;
import com.caredesk.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ResponseService {

    // Create Response
    public boolean createResponse(Response response) {
        String query = "INSERT INTO responses (ticket_id, admin_id, message) VALUES (?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, response.getTicketId());
            stmt.setInt(2, response.getAdminId());
            stmt.setString(3, response.getMessage());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Response by ID
    public Response getResponse(int id) {
        String query = "SELECT * FROM view_responses WHERE response_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Response response = new Response();
                response.setResponseId(rs.getInt("response_id"));
                response.setTicketId(rs.getInt("ticket_id"));
                response.setAdminId(rs.getInt("admin_id"));
                response.setResponderName(rs.getString("responder_name"));
                response.setResponderRole(rs.getString("responder_role"));
                response.setMessage(rs.getString("message"));
                response.setCreatedAt(rs.getString("created_at"));
                return response;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Responses
    public List<Response> getAllResponses() {
        List<Response> responses = new ArrayList<>();
        String query = "SELECT * FROM view_responses ORDER BY response_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Response response = new Response();
                response.setResponseId(rs.getInt("response_id"));
                response.setTicketId(rs.getInt("ticket_id"));
                response.setAdminId(rs.getInt("admin_id"));
                response.setResponderName(rs.getString("responder_name"));
                response.setResponderRole(rs.getString("responder_role"));
                response.setMessage(rs.getString("message"));
                response.setCreatedAt(rs.getString("created_at"));
                responses.add(response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return responses;
    }

    // Update Response
    public boolean updateResponse(Response response) {
        String query = "UPDATE responses SET ticket_id = ?, admin_id = ?, message = ? WHERE response_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, response.getTicketId());
            stmt.setInt(2, response.getAdminId());
            stmt.setString(3, response.getMessage());
            stmt.setInt(4, response.getResponseId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Response
    public boolean deleteResponse(int id) {
        String query = "DELETE FROM responses WHERE response_id = ?";
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