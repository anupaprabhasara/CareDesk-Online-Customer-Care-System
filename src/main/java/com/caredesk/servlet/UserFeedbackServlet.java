package com.caredesk.servlet;

import com.caredesk.model.Feedback;
import com.caredesk.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/feedback")
public class UserFeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Login Check
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        request.setAttribute("isLoggedIn", isLoggedIn);

        if (!isLoggedIn) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");
        String responseIdParam = request.getParameter("responseId");

        try {
            if (action == null) {
                // View all feedback given by current user
                List<Feedback> feedbacks = feedbackService.getAllFeedbacks();
                feedbacks.removeIf(fb -> fb.getUserId() != userId);
                request.setAttribute("feedbacks", feedbacks);
                request.getRequestDispatcher("/client/feedback/index.jsp").forward(request, response);

            } else if ("create".equals(action) && responseIdParam != null) {
                // Show feedback form for specific response
                request.setAttribute("responseId", responseIdParam);
                request.getRequestDispatcher("/client/feedback/create.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int feedbackId = Integer.parseInt(request.getParameter("id"));
                Feedback feedback = feedbackService.getFeedback(feedbackId);
                if (feedback != null && feedback.getUserId() == userId) {
                    feedbackService.deleteFeedback(feedbackId);
                    response.sendRedirect(request.getContextPath() + "/feedback");
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "You can only delete your own feedback.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action or missing parameters.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Something went wrong.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Login Check
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        request.setAttribute("isLoggedIn", isLoggedIn);

        if (!isLoggedIn) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = (int) session.getAttribute("userId");
        String action = request.getParameter("action");

        try {
            if ("create".equals(action)) {
                int responseId = Integer.parseInt(request.getParameter("responseId"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                String comment = request.getParameter("comment");

                Feedback feedback = new Feedback();
                feedback.setResponseId(responseId);
                feedback.setUserId(userId);
                feedback.setRating(rating);
                feedback.setComment(comment);

                if (feedbackService.createFeedback(feedback)) {
                    response.sendRedirect(request.getContextPath() + "/feedback");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to submit feedback.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}