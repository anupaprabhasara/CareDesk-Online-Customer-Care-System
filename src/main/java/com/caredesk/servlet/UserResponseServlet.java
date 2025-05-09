package com.caredesk.servlet;

import com.caredesk.model.Response;
import com.caredesk.service.ResponseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/responses")
public class UserResponseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ResponseService responseService;

    @Override
    public void init() throws ServletException {
        responseService = new ResponseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Login check
        HttpSession session = request.getSession(false);
        boolean isLoggedIn = (session != null && session.getAttribute("user") != null);
        request.setAttribute("isLoggedIn", isLoggedIn);

        if (!isLoggedIn) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
            String ticketIdParam = request.getParameter("ticketId");
            if (ticketIdParam == null) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Ticket ID is required.");
                return;
            }

            int ticketId = Integer.parseInt(ticketIdParam);
            List<Response> responses = responseService.getResponsesByTicketId(ticketId);
            request.setAttribute("responses", responses);
            request.setAttribute("ticketId", ticketId);
            request.getRequestDispatcher("/client/responses/index.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving responses.");
        }
    }
}