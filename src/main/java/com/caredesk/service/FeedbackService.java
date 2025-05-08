package com.caredesk.service;

import com.caredesk.model.Feedback;
import com.caredesk.util.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FeedbackService {

    // Create Feedback
    public boolean createFeedback(Feedback feedback) {
        String query = "INSERT INTO feedback (response_id, user_id, rating, comment) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, feedback.getResponseId());
            stmt.setInt(2, feedback.getUserId());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getComment());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Get Feedback by ID
    public Feedback getFeedback(int id) {
        String query = "SELECT * FROM view_feedback WHERE feedback_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setResponseId(rs.getInt("response_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setUserName(rs.getString("user_name"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                return feedback;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Feedbacks
    public List<Feedback> getAllFeedbacks() {
        List<Feedback> feedbacks = new ArrayList<>();
        String query = "SELECT * FROM view_feedback ORDER BY feedback_id";
        try (Connection connection = DBConnection.getConnection();
             Statement stmt = connection.createStatement()) {
            ResultSet rs = stmt.executeQuery(query);
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setFeedbackId(rs.getInt("feedback_id"));
                feedback.setResponseId(rs.getInt("response_id"));
                feedback.setUserId(rs.getInt("user_id"));
                feedback.setUserName(rs.getString("user_name"));
                feedback.setRating(rs.getInt("rating"));
                feedback.setComment(rs.getString("comment"));
                feedbacks.add(feedback);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return feedbacks;
    }

    // Update Feedback
    public boolean updateFeedback(Feedback feedback) {
        String query = "UPDATE feedback SET response_id = ?, user_id = ?, rating = ?, comment = ? WHERE feedback_id = ?";
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, feedback.getResponseId());
            stmt.setInt(2, feedback.getUserId());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getComment());
            stmt.setInt(5, feedback.getFeedbackId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Delete Feedback
    public boolean deleteFeedback(int id) {
        String query = "DELETE FROM feedback WHERE feedback_id = ?";
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