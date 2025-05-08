package com.caredesk.servlet;

import com.caredesk.service.FeedbackService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/feedback")
public class FeedbackServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private FeedbackService feedbackService;

    @Override
    public void init() throws ServletException {
        feedbackService = new FeedbackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        // Role check
        String role = (String) session.getAttribute("role");
        if ("Admin".equals(role)) {
            response.setContentType("text/html");
            response.getWriter().println("<script type=\"text/javascript\">");
            response.getWriter().println("window.location = '" + request.getContextPath() + "/admin/admin';");
            response.getWriter().println("</script>");
            return;
        }

        try {
            if (action == null) {
                // List all feedbacks
                request.setAttribute("feedbacks", feedbackService.getAllFeedbacks());
                request.getRequestDispatcher("/admin/feedbacks/index.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("id"));
                feedbackService.deleteFeedback(id);
                response.sendRedirect(request.getContextPath() + "/admin/feedback");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
}