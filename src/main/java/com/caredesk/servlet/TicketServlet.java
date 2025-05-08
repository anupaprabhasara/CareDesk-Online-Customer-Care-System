package com.caredesk.servlet;

import com.caredesk.service.TicketService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/ticket")
public class TicketServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private TicketService ticketService;

    @Override
    public void init() throws ServletException {
        ticketService = new TicketService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }
        
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
            request.setAttribute("tickets", ticketService.getAllTickets());
            request.getRequestDispatcher("/admin/tickets/index.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to load tickets.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session Check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        try {
            String action = request.getParameter("action");

            if ("updateStatus".equals(action)) {
                int ticketId = Integer.parseInt(request.getParameter("ticketId"));
                String status = request.getParameter("status");

                if (ticketService.updateTicketStatus(ticketId, status)) {
                    response.sendRedirect(request.getContextPath() + "/admin/ticket");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update ticket status.");
                }
            } else if ("delete".equals(action)) {
                int ticketId = Integer.parseInt(request.getParameter("ticketId"));
                ticketService.deleteTicket(ticketId);
                response.sendRedirect(request.getContextPath() + "/admin/ticket");
            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }
}