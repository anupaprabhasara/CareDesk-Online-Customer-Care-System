package com.caredesk.servlet;

import com.caredesk.model.Ticket;
import com.caredesk.service.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/ticket")
public class UserTicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private TicketService ticketService;

    @Override
    public void init() throws ServletException {
        ticketService = new TicketService();
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

        try {
            if (action == null) {
                // List user’s own tickets
                List<Ticket> allTickets = ticketService.getAllTickets();
                allTickets.removeIf(ticket -> ticket.getUserId() != userId);
                request.setAttribute("tickets", allTickets);
                request.getRequestDispatcher("/client/tickets/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                request.getRequestDispatcher("/client/tickets/create.jsp").forward(request, response);

            } else if ("delete".equals(action)) {
                int ticketId = Integer.parseInt(request.getParameter("id"));
                Ticket ticket = ticketService.getTicket(ticketId);
                if (ticket != null && ticket.getUserId() == userId) {
                    ticketService.deleteTicket(ticketId);
                    response.sendRedirect(request.getContextPath() + "/ticket");
                } else {
                    response.sendError(HttpServletResponse.SC_FORBIDDEN, "You can only delete your own tickets.");
                }

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
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
                String subject = request.getParameter("subject");
                String description = request.getParameter("description");
                String category = request.getParameter("category");

                Ticket ticket = new Ticket();
                ticket.setUserId(userId);
                ticket.setSubject(subject);
                ticket.setDescription(description);
                ticket.setCategory(category);
                ticket.setStatus("Open");

                if (ticketService.createTicket(ticket)) {
                    response.sendRedirect(request.getContextPath() + "/ticket");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create ticket.");
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