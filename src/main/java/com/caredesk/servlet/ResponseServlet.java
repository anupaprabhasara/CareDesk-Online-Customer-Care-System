package com.caredesk.servlet;

import com.caredesk.model.Response;
import com.caredesk.service.ResponseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/response")
public class ResponseServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private ResponseService responseService;

    @Override
    public void init() throws ServletException {
        responseService = new ResponseService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
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
                // List all responses
                request.setAttribute("responses", responseService.getAllResponses());
                request.getRequestDispatcher("/admin/responses/index.jsp").forward(request, response);

            } else if ("create".equals(action)) {
                int ticketId = Integer.parseInt(request.getParameter("ticketId"));
                request.setAttribute("ticketId", ticketId);
                request.getRequestDispatcher("/admin/responses/create.jsp").forward(request, response);

            } else if ("edit".equals(action)) {
                int responseId = Integer.parseInt(request.getParameter("responseId"));
                int ticketId = Integer.parseInt(request.getParameter("ticketId"));
                Response res = responseService.getResponse(responseId);
                if (res != null) {
                    request.setAttribute("response", res);
                    request.setAttribute("ticketId", ticketId);
                    request.getRequestDispatcher("/admin/responses/update.jsp").forward(request, response);
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Response not found.");
                }

            } else if ("delete".equals(action)) {
                int id = Integer.parseInt(request.getParameter("responseId"));
                responseService.deleteResponse(id);
                response.sendRedirect(request.getContextPath() + "/admin/response");

            } else {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Session check
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/admin/login");
            return;
        }

        String action = request.getParameter("action");

        try {
            int ticketId = Integer.parseInt(request.getParameter("ticketId"));
            int adminId = (int) session.getAttribute("adminId");
            String message = request.getParameter("message");

            if ("create".equals(action)) {
                Response res = new Response();
                res.setTicketId(ticketId);
                res.setAdminId(adminId);
                res.setMessage(message);

                if (responseService.createResponse(res)) {
                    response.sendRedirect(request.getContextPath() + "/admin/response");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to create response.");
                }

            } else if ("update".equals(action)) {
                int responseId = Integer.parseInt(request.getParameter("responseId"));

                Response res = new Response();
                res.setResponseId(responseId);
                res.setTicketId(ticketId);
                res.setAdminId(adminId); // still get adminId from session
                res.setMessage(message);

                if (responseService.updateResponse(res)) {
                    response.sendRedirect(request.getContextPath() + "/admin/response");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update response.");
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